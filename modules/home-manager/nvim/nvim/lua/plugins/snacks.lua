return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    input = {
      win = {
        relative = "cursor",
        width = 25,
        row = -3,
        col = 0,
      },
    },
    picker = {},
  },
  keys = {
    {
      "<leader>?",
      function()
        Snacks.picker.recent()
      end,
      desc = "[?] Find recently opened files",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.smart()
      end,
      desc = "[ ] Find Files",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "[/] Search by Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      mode = { "n", "x" },
      desc = "[S]earch current [W]ord",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "[S]earch [D]iagnostics",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.resume()
      end,
      desc = "[S]earch [R]esume",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.spelling()
      end,
      desc = "[S]earch [S]pelling",
    },

    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "[G]oto [D]efinition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "[G]oto [D]eclaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "[G]oto [R]eferences",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "[G]oto [I]mplementation",
    },
  },
}
