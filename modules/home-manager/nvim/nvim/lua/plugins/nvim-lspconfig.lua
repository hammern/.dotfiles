return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- Enable the following language servers
    servers = {
      gopls = {},
      rust_analyzer = {
        ["rust-analyzer"] = {
          cargo = {
            features = "all",
          },
          check = {
            command = "clippy",
          },
        },
      },
      ts_ls = {},
      bashls = {},
      yamlls = {},
      dockerls = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      nixd = {},
      clangd = {},
    },
  },
  config = function(_, opts)
    --  This function gets run when an LSP attaches to a particular buffer.
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(event.buf, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
      end,
    })

    -- Setup LSPs
    local lspconfig = require("lspconfig")
    for server_name, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server_name].setup(config)
    end
  end,
}
