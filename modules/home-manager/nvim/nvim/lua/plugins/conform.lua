return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },

      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      svelte = { "prettierd" },
      css = { "prettierd" },
      html = { "prettierd" },

      json = { "prettierd" },
      yaml = { "prettierd" },

      markdown = { "markdownlint" },

      sh = { "shellcheck", "shfmt" },

      python = { "isort", "black" },

      go = { "gofumpt" },

      rust = { "rustfmt" },

      nix = { "nixfmt" },

      c = { "clang-format" },
    },
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = { timeout_ms = 500 },
    notify_on_error = false,
  },
}
