return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
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
      rust_analyzer = {},
      ts_ls = {},
      bashls = {},
      yamlls = {},
      dockerls = {},
      lua_ls = {},
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
    for server_name, config in pairs(opts.servers) do
      vim.lsp.config(server_name, config)
      vim.lsp.enable(server_name)
    end
  end,
}
