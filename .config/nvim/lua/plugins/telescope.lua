return {
  -- Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }
    table.insert(vimgrep_arguments, "--hidden")

    -- See `:help telescope` and `:help telescope.setup()`
    require("telescope").setup({
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
        file_ignore_patterns = { ".git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")
  end,
  keys = {
    { "<leader>?", "<cmd>Telescope oldfiles<cr>", desc = "[?] Find recently opened files" },
    { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "[ ] Find Files" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "[/] Search by Grep" },
    { "<leader>ss", "<cmd>Telescope<cr>", desc = "[S]earch [S]elect Telescope" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "[S]earch [R]esume" },
  },
}
