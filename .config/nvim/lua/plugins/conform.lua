return {
  "stevearc/conform.nvim",
  lazy = true,
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = require("plugins.mason-tool-installer.formatters"),
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
      quiet = true,
    },
  },
}
