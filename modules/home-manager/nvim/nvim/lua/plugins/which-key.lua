return {
  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    spec = {
      { "<leader>s", group = "[S]earch", mode = { "n", "x" } },
    },
  },
}
