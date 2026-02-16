require("config.lazy")
require("config.remap")
require("config.set")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank({ timeout = 20 })
  end,
})

vim.diagnostic.config {
  update_in_insert = true,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = {
    source = 'if_many',
    spacing = 2,
  },
}

local blink_cmp = require('blink-cmp')

local servers = {
  -- tsserver = {
  --   cmd = { 'typescript-language-server', '--stdio' },
  --   filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
  --   root_markers = { 'package.json', 'tsconfig.json', '.git' },
  --   settings = {},
  -- },
  -- biome = {},
  tailwindcss = {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    root_dir = function(bufnr, on_dir)
      local root = vim.fs.root(bufnr, { 'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js' })
          or vim.fs.root(bufnr, 'package.json')
      if root then on_dir(root) end
    end,
    settings = {
      tailwindCSS = {
        validate = true,
        colorDecorators = false,
        lint = {
          cssConflict = 'warning',
          invalidApply = 'error',
          invalidScreen = 'error',
          invalidVariant = 'error',
          invalidConfigPath = 'error',
          invalidTailwindDirective = 'error',
          recommendedVariantOrder = 'warning',
        },
        classAttributes = {
          'class',
          'className',
        },
      },
    },
  },
  tsgo = {
    cmd = { 'tsgo', '--lsp', '--stdio' },
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact'
    },
    root_dir = function(bufnr, on_dir)
      local root = vim.fs.root(bufnr, {
        'tsconfig.json',
        'jsconfig.json',
        'package.json',
        'pnpm-workspace.yaml',
        '.git',
      }) or vim.fn.getcwd()

      on_dir(root)
    end,
  },
  lua_ls = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',

        },
        diagnostics = {
          globals = { 'vim' },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

-- Retrieve the default LSP client capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Merge blink-cmp capabilities with the default capabilities
capabilities = vim.tbl_deep_extend('force', capabilities, blink_cmp.get_lsp_capabilities())

-- Configure and enable each LSP server
for server, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

-- Set up autocommands for LSP features
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Disable for when it conflicts with prettier all the time
    -- local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local buf = args.buf
    --
    -- if client:supports_method('textDocument/formatting') then
    --   vim.api.nvim_create_autocmd('BufWritePre', {
    --     buffer = args.buf,
    --     callback = function()
    --       vim.lsp.buf.format({ bufnr = buf, id = client.id, timeout_ms = 1000 })
    --     end,
    --   })
    -- end

    vim.keymap.set('n', 'g.', vim.lsp.buf.code_action, { buffer = buf, desc = 'LSP: Code Action' })
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { buffer = buf, desc = 'LSP: Hover' })
    vim.keymap.set("n", "<bs>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
  end,
})
