vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
  options = {
    theme = "tokyonight",
    component_separators = "|",
    section_separators = "",
  },
  extensions = { "oil" },
})
