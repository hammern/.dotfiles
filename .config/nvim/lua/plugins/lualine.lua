return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine",
  },
  opts = {
    options = {
      theme = "tokyonight",
      component_separators = "|",
      section_separators = "",
    },
    sections = {
      lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
    },
    extensions = { "oil" },
  },
}
