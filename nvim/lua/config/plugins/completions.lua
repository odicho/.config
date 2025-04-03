return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { keyword = { range = 'prefix' }, accept = { auto_brackets = { enabled = false }, }, ghost_text = { enabled = true }, documentation = { auto_show = false } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },

    },
  }
}
