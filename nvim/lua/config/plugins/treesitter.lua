return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local parsers = {
      "typescript",
      "javascript",
      "tsx",
      "html",
      "css",
      "json",
      "bash",
      "c",
      "diff",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
    }

    require("nvim-treesitter").install(parsers)

    local filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "html",
      "css",
      "json",
      "bash",
      "c",
      "diff",
      "lua",
      "markdown",
      "vim",
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
