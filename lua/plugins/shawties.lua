return {
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>uu", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "preservim/vim-pencil",
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  },
}
