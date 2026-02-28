return {
  {
    "folke/snacks.nvim",
    opts = function()
      local full_layout = {
        reverse = true,
        layout = {
          box = "horizontal",
          backdrop = false,
          width = 0.99,
          height = 0.99,
          border = "none",
          {
            box = "vertical",
            { win = "list",  title = " Results ", title_pos = "center", border = true },
            { win = "input", height = 1,          border = true,        title = "{title} {live} {flags}", title_pos = "center" },
          },
          {
            win = "preview",
            title = "{preview:Preview}",
            width = 0.55,
            border = true,
            title_pos = "center",
          },
        },
      }

      return {
        picker = {
          filter = { cwd = true },
          exclude = {
            "**/.svn",
            "**/.hg",
            "**/CVS",
            "**/.DS_Store",
            "**/Thumbs.db",
            "**/.classpath",
            "**/.settings",
            "**/.yarn",
            "**.lock",
            "**/__mocks__/**",
          },
          matcher = { fuzzy = true },
          formatters = {
            file = { min_width = 100, truncate = "beginning", filename_first = true },
          },
          sources = {
            explorer = {
              auto_close = true,
              layout = {
                layout = {
                  position = "right",
                  width = 50
                },
              },
            },
            grep = { layout = full_layout },
            buffers = { layout = full_layout },
            smart = { layout = full_layout },
            lsp_definitions = { layout = full_layout },
            lsp_references = { layout = full_layout },
            lsp_type_definitions = { layout = full_layout },
          },
        },
        explorer = {
          enabled = false,
          replace_netrw = true,
        },
      }
    end,

    keys = {
      {
        "<leader>,",
        function()
          Snacks.picker.buffers({
            on_show = function() vim.cmd.stopinsert() end,
            current = false,
            layout = { preview = false },
          })
        end,
        desc = "buffer switcher",
      },
      {
        "<bs><leader>",
        function()
          Snacks.picker.buffers({
            on_show = function() vim.cmd.stopinsert() end,
            current = false,
            layout = { preview = false },
          })
        end,
        desc = "buffer switcher",
      },

      -- {
      --   "<leader>/",
      --   function() Snacks.picker.grep() end,
      --   desc = "Grep",
      -- },
      {
        "<leader>e",
        function() Snacks.explorer() end,
        desc = "File Explorer",
      },
      -- LSP
      {
        "gd",
        function() Snacks.picker.lsp_definitions() end,
        desc = "Goto definition"
      },
      { "gr", function() Snacks.picker.lsp_references({ on_show = function() vim.cmd.stopinsert() end, }) end, nowait = true, desc = "References" },
      {
        "gy",
        function() Snacks.picker.lsp_type_definitions() end,
        desc = "Goto T[y]pe Definition"
      },
    },
  },
}
