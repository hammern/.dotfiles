return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      "williamboman/mason.nvim",
      config = true,
      cmd = "Mason",
      keys = {
        { "<leader>m", "<cmd>Mason<cr>", { desc = { "[M]ason" } } },
      },
    },
    "williamboman/mason-lspconfig.nvim",
    "whoissethdaniel/mason-tool-installer.nvim",

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    { "folke/neodev.nvim", ft = { "lua", "vim" } },
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("<leader>cA", function()
        vim.lsp.buf.code_action({ context = { only = { "source " } } })
      end, "[S]ource [A]ction")

      local builtin = require("telescope.builtin")

      nmap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
      nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
      nmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")

      -- See `:help K` for why this keymap
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")

      -- Lesser used LSP functionality
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })
    end

    -- mason-lspconfig requires that these setup functions are called in this order
    -- before setting up the servers.
    require("mason").setup()
    require("mason-lspconfig").setup()

    -- Enable the following language servers
    local servers = {
      gopls = {},
      rust_analyzer = {
        check = {
          command = "clippy",
        },
      },
      tsserver = {},
      html = {},
      bashls = {},
      yamlls = {},
      dockerls = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Setup neovim lua configuration
    require("neodev").setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true,
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    })

    local get_table_values = function(table)
      return vim.tbl_flatten(vim.tbl_values(table))
    end

    local formatters_by_ft = require("plugins.mason-tool-installer.formatters")
    local linters_by_ft = require("plugins.mason-tool-installer.linters")

    local tools = vim.list_extend(get_table_values(formatters_by_ft), get_table_values(linters_by_ft))

    table.sort(tools)
    vim.fn.uniq(tools)

    -- Automatically install formatters and linters
    require("mason-tool-installer").setup({
      ensure_installed = tools,
    })
  end,
}
