return {
  "dmtrKovalenko/fold-imports.nvim",
  opts = {},
  event = "BufRead",
  keys = {
    {
      "<bs>fi",
      function()
        require("fold_imports").toggle()
      end,
      desc = "Toggle fold imports",
    },
    {
      "<leader>fi",
      function()
        require("fold_imports").toggle()
      end,
      desc = "Toggle fold imports",
    },
  },
}
