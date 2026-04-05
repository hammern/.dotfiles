vim.pack.add({
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

require("fidget").setup({})

require("lazydev").setup()

local servers = {
  gopls = {},
  rust_analyzer = {},
  ts_ls = {},
  bashls = {},
  yamlls = {},
  dockerls = {},
  lua_ls = {},
  nixd = {},
  clangd = {},
}

for name, config in pairs(servers) do
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end
