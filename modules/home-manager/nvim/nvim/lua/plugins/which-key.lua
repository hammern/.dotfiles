return {
  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    spec = {
      { "<leader>c", group = "[C]ode" },
      { "<leader>g", group = "[G]it", mode = { "n", "v" } },
      { "<leader>s", group = "[S]earch" },
    },
  },
}
