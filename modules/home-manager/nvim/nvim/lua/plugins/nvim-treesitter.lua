return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  -- See `:help nvim-treesitter`
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "tsx", "javascript", "typescript", "vimdoc", "vim", "bash", "hyprlang" },

      -- Autoinstall languages that are not installed
      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
  init = function()
    vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })
  end,
}
