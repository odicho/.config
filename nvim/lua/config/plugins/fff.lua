return {
  "dmtrKovalenko/fff.nvim",
  build = "cargo build --release",
  opts = {},
  keys = {
    {
      "<bs>p",
      function()
        require("fff").find_files()
      end,
      desc = "Open file picker",
    },
    {
      "<leader>p",
      function()
        require("fff").find_files()
      end,
      desc = "Open file picker",
    },
  },
}
