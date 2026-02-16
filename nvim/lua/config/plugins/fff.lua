return {
  "dmtrKovalenko/fff.nvim",
  build = function ()
    require("fff.download").download_or_build_binary()  
  end,
  lazy= false,
  opts = {
    prompt = '> ',
    layout = {
      height = 0.95,
      width = 1,
    },
  },
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
