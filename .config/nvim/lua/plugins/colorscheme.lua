return {
  { "catppuccin/nvim", name = "catppuccin", lazy = "false", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").load()
      end,
    },
  },
}
