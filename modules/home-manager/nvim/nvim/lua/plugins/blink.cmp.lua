return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      list = {
        selection = {
          auto_insert = false,
        },
      },
    },

    signature = {
      enabled = true,
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
