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


return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      css = { "biome" },
      html = { "biome" },
      markdown = { "biome" },
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    vim.keymap.set("n", "<bs>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "Format file with Biome" })

    vim.keymap.set("n", "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "Format file with Biome" })

    vim.keymap.set("v", "<bs>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "Format selection with Biome" })

    vim.keymap.set("v", "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "Format selection with Biome" })
  end,
}
