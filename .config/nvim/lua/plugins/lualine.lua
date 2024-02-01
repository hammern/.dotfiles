return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "f-person/git-blame.nvim",
    "AndreM222/copilot-lualine",
  },
  config = function()
    vim.g.gitblame_display_virtual_text = 0
    local git_blame = require("gitblame")

    require("lualine").setup({
      options = {
        theme = "tokyonight",
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_c = { "filename", { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
        lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
      },
      extensions = { "oil" },
    })
  end,
}
