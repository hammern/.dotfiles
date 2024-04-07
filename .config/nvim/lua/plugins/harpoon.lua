return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "[A]ppend to Harpoon",
    },
    {
      "<C-e>",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Toggle Harpoon Menu",
    },

    {
      "<A-h>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Select Harpoon 1",
    },
    {
      "<A-j>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Select Harpoon 2",
    },
    {
      "<A-k>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Select Harpoon 3",
    },
    {
      "<A-l>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Select Harpoon 4",
    },

    {
      "<C-S-P>",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Go to Previous Harpoon File",
    },
    {
      "<C-S-N>",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Go to Next Harpoon File",
    },
  },
}
