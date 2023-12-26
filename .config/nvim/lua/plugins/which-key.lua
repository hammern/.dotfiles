return {
  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  init = function()
    local whichkey = require("which-key")

    -- document existing key chains
    whichkey.register({
      ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
      ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
    })
    -- register which-key VISUAL mode
    -- required for visual <leader>gs (git stage) to work
    whichkey.register({
      ["<leader>"] = { name = "VISUAL <leader>" },
      ["<leader>g"] = { "[G]it" },
    }, { mode = "v" })
  end,
}
