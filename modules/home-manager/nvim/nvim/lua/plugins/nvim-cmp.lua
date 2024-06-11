return {
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Adds LSP completion capabilities
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",

    -- Adds a number of user-friendly snippets
    "rafamadriz/friendly-snippets",

    -- Adds icons to completion items
    "onsails/lspkind-nvim",
  },
  config = function()
    -- See `:help cmp`
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = { format = require("lspkind").cmp_format({}) },
      completion = { completeopt = "menu,menuone,noinsert" },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-space>"] = cmp.mapping.complete({}),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "crates" },
        { name = "lazydev", group_index = 0 },
      },
    })
  end,
}
