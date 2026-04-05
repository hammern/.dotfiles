vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["<C-l>"] = false, -- fix collision with vim-tmux-navigator
  },
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
