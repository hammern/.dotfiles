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
    },
  },
  config = function(_, opts)
    --  This function gets run when an LSP attaches to a particular buffer.
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local nmap = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP:" .. desc })
        end

        nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        nmap("<leader>cA", function()
          ---@diagnostic disable-next-line: missing-fields
          vim.lsp.buf.code_action({ context = { only = { "source" } } })
        end, "[S]ource [A]ction")

        nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(event.buf, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
      end,
    })

    -- Setup LSPs
    local lspconfig = require("lspconfig")
    for server_name, config in pairs(opts.servers) do
      config.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities())
      lspconfig[server_name].setup(config)
    end
  end,
}
