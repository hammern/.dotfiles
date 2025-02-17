return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    input = {
      win = {
        relative = "cursor",
        width = 25,
        row = -3,
        col = 0,
      },
    },
  },
}
