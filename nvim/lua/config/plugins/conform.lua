-- return {
--   "stevearc/conform.nvim",
--   opts = {
--     formatters_by_ft = {
--       javascript = { "prettier" },
--       typescript = { "prettier" },
--       javascriptreact = { "prettier" },
--       typescriptreact = { "prettier" },
--       json = { "prettier" },
--       css = { "prettier" },
--       html = { "prettier" },
--       markdown = { "prettier" },
--     },
--   },
--   config = function(_, opts)
--     local conform = require("conform")
--     conform.setup(opts)
--
--     vim.keymap.set("n", "<bs>f", function()
--       conform.format({ async = true, lsp_fallback = true })
--     end, { desc = "Format file with Prettier" })
--
--     vim.keymap.set("n", "<leader>f", function()
--       conform.format({ async = true, lsp_fallback = true })
--     end, { desc = "Format file with Prettier" })
--
--     vim.keymap.set("v", "<bs>f", function()
--       conform.format({ async = true, lsp_fallback = true })
--     end, { desc = "Format selection with Prettier" })
--
--     vim.keymap.set("v", "<leader>f", function()
--       conform.format({ async = true, lsp_fallback = true })
--     end, { desc = "Format selection with Prettier" })
--   end,
-- }


-- look up how to do multiple formatters
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "biome", "oxfmt" },
      typescript = { "biome", "oxfmt" },
      javascriptreact = { "biome", "oxfmt" },
      typescriptreact = { "biome", "oxfmt" },
      json = { "biome", "oxfmt" },
      css = { "biome", "oxfmt" },
      scss = { "biome", "oxfmt" },
      markdown = { "oxfmt" },
    },
    formatters = {
      biome = {
        command = "biome",
        args = { "format", "--stdin-file-path", "$FILENAME" },
        stdin = true,
        condition = function(ctx)
          return vim.fs.find(
            { "biome.json", "biome.jsonc" },
            { path = ctx.dirname, upward = true }
          )[1] ~= nil
        end,
      },
      oxfmt = {
        command = "oxfmt",
        stdin = true,
      },
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    vim.keymap.set("n", "<bs>f", function()
      conform.format({ async = true, lsp_fallback = true, stop_after_first = true })
    end, { desc = "Format file with oxfmt" })

    vim.keymap.set("n", "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true, stop_after_first = true, })
    end, { desc = "Format file with oxfmt" })

    vim.keymap.set("v", "<bs>f", function()
      conform.format({ async = true, lsp_fallback = true, stop_after_first = true })
    end, { desc = "Format selection with oxfmt" })

    vim.keymap.set("v", "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true, stop_after_first = true })
    end, { desc = "Format selection with oxfmt" })
  end,
}
