return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        filter = {
          cwd = true,
        },
        exclude = {
          "**/.git",
          "**/.svn",
          "**/.hg",
          "**/CVS",
          "**/.DS_Store",
          "**/Thumbs.db",
          "**/.classpath",
          "**/.settings",
          "**/.yarn",
          "**/stories/**",
          "**/**.{stories}.**",
          "**/__tests__/**",
          "**/**.{test,tests}.**",
          "**/__mocks__/**",
          "**public/**",
          "**.png"
        },
        layout = {
          preview = "main",
          preset = "ivy",
        },
        -- matcher = {
        --   frecency = true,
        -- },
        formatters = {
          file = {
            truncate = 80,
            filename_first = true
          },
        },
        sources = {
          explorer = {
            auto_close = true,
            layout = {
              layout = {
                position = "right"
              },
            },
          },
        },

      },
      explorer = {},
    },
    keys = {
      { "<bs>p",     function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>p", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      {
        '<bs><leader>',
        function()
          Snacks.picker.buffers({
            on_show = function()
              vim.cmd.stopinsert()
            end,
            current = false,
            layout = { preview = false },
          })
        end,
        desc = 'buffer switcher',
      },
      {
        '<leader>,',
        function()
          Snacks.picker.buffers({
            on_show = function()
              vim.cmd.stopinsert()
            end,
            current = false,
            layout = { preview = false },
          })
        end,
        desc = 'buffer switcher',
      },
      { "<leader>/",  function() Snacks.picker.grep() end,             desc = "Grep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end,        desc = "Visual selection or word", mode = { "n", "x" } },
      { "<leader>e",  function() Snacks.explorer() end,                desc = "File Explorer" },
      -- LSP
      { "gd",         function() Snacks.picker.lsp_definitions() end,  desc = "Goto Definition" },
      { "gD",         function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      {
        "gr",
        function()
          Snacks.picker.lsp_references({
            on_show = function()
              vim.cmd.stopinsert()
            end,
          })
        end,
        nowait = true,
        desc = "References"
      },
      { "gi", function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    }
  }
}
