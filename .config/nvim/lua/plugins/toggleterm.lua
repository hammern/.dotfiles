local open_fullscreen_terminal = function(cmd)
  local terminal = require("toggleterm.terminal").Terminal:new({
    cmd = cmd,
    hidden = true,
    direction = "float",
    float_opts = {
      width = vim.o.columns,
      height = vim.o.lines,
    },
  })
  terminal:toggle()
end

return {
  "akinsho/toggleterm.nvim",
  opts = {},
  keys = {
    {
      "<leader>gg",
      function()
        open_fullscreen_terminal("lazygit")
      end,
      desc = "Open Lazy[G]it",
    },
    {
      "<leader>d",
      function()
        open_fullscreen_terminal("lazydocker")
      end,
      desc = "Open Lazy[D]ocker",
    },
  },
}
