-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>dd", function()
  require("lazyvim.util").terminal.open({ "lazydocker" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Docker" })
