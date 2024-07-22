return {
  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    require("which-key").setup({})

    -- document existing key chains
    require("which-key").add({
      { "<leader>c", group = "[C]ode" },
      { "<leader>g", group = "[G]it", mode = { "n", "v" } },
      { "<leader>s", group = "[S]earch" },
    })
  end,
}
