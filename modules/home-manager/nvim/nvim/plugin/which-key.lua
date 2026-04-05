vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
  spec = {
    { "<leader>s", group = "[S]earch", mode = { "n", "x" } },
  },
})
