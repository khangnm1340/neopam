---@diagnostic disable: undefined-doc-name
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
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = {
          opts = {
            size = {
              max_height = 14,
            },
          },
        },
        hover = {
          opts = {
            size = {
              max_height = 16,
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "clang-format", "ast-grep", "codelldb", "cpplint", "debugpy" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>p", ":Gitsigns preview_hunk<CR>", {})
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      labels = "jkluiohprewtfdsgvmcbxqy",
    },
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter({labels = "jkluiohprewtfdsgvmcbxqy"}) end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      },
  },
}
