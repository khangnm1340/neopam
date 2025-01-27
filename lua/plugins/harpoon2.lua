return {

  "ThePrimeagen/harpoon",
  keys = function()
    return {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<C-e>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<C-j>",
        function()
          require("harpoon"):list():select(1)
        end,
      },
      {
        "<C-k>",
        function()
          require("harpoon"):list():select(2)
        end,
      },
      {
        "<C-l>",
        function()
          require("harpoon"):list():select(3)
        end,
      },
      {
        "<C-h>",
        function()
          require("harpoon"):list():select(4)
        end,
      },
    }
  end,
}
