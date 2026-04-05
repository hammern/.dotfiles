vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "[A]ppend to Harpoon" })
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon Menu" })

vim.keymap.set("n", "<A-h>", function()
  harpoon:list():select(1)
end, { desc = "Select Harpoon 1" })
vim.keymap.set("n", "<A-j>", function()
  harpoon:list():select(2)
end, { desc = "Select Harpoon 2" })
vim.keymap.set("n", "<A-k>", function()
  harpoon:list():select(3)
end, { desc = "Select Harpoon 3" })
vim.keymap.set("n", "<A-l>", function()
  harpoon:list():select(4)
end, { desc = "Select Harpoon 4" })
