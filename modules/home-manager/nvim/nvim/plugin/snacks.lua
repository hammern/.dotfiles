vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  input = {
    win = {
      relative = "cursor",
      width = 25,
      row = -3,
      col = 0,
    },
  },
  picker = {},
  indent = { animate = { enabled = false } },
  terminal = {},
})

-- Picker
vim.keymap.set("n", "<leader>?", function()
  Snacks.picker.recent()
end, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><leader>", function()
  Snacks.picker.smart()
end, { desc = "[ ] Find Files" })
vim.keymap.set("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "[/] Search by Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function()
  Snacks.picker.grep_word()
end, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", function()
  Snacks.picker.resume()
end, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>ss", function()
  Snacks.picker.spelling()
end, { desc = "[S]earch [S]pelling" })

-- LSP
vim.keymap.set("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gD", function()
  Snacks.picker.lsp_declarations()
end, { desc = "[G]oto [D]eclaration" })
vim.keymap.set("n", "grr", function()
  Snacks.picker.lsp_references()
end, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gri", function()
  Snacks.picker.lsp_implementations()
end, { desc = "[G]oto [I]mplementation" })

-- Terminal
vim.keymap.set("n", "<leader>g", function()
  Snacks.terminal("lazygit", { win = { width = vim.o.columns, height = vim.o.lines } })
end, { desc = "Open Lazy[G]it" })
vim.keymap.set("n", "<leader>d", function()
  Snacks.terminal("lazydocker", { win = { width = vim.o.columns, height = vim.o.lines } })
end, { desc = "Open Lazy[D]ocker" })
