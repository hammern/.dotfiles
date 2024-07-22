return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = require("plugins.mason-tool-installer.formatters"),
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = { timeout_ms = 500 },
    notify_on_error = false,
  },
}
