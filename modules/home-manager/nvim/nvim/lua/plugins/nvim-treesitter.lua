return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "<filetype>" },
      callback = function()
        vim.treesitter.start()
      end,
    })

    require("nvim-treesitter").install({
      "bash",
      "c",
      "fish",
      "gitignore",
      "hyprlang",
      "lua",
      "markdown",
      "nix",
      "python",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
    })
  end,
}
