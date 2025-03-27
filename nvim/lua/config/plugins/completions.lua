return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { accept = { auto_brackets = { enabled = false }, }, documentation = { auto_show = false } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
    },
  }
}
