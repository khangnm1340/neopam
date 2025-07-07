---@diagnostic disable: undefined-doc-name
return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            find = "jdtls",
          },
          opts = { skip = true },
        },
      },
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
      labels = "jkluiohprewtfsgvmbq",
      highlight = {
        -- backdrop = false,
      },
      modes = {
        char = {
          jump_labels = true,
          label = { exclude = "o" },
          multi_line = true,
          highlight = {
            backdrop = true,
          },
        },
      },
    },
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter({labels = "jkluiohprewtfsgvmcbq"}) end, desc = "Flash Treesitter" },
        -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      },
  },
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({

        visualSelectionUsage = "operate-within-range",
        keymaps = {
          openNextLocation = { n = "<M-j>" },
          openPrevLocation = { n = "<M-k>" },
        },
      })
    end,
  },
  -- { "folke/which-key.nvim", opts = { disable = { ft = { "grug-far" } } } },
  {
    "opdavies/toggle-checkbox.nvim",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>t",
        ":lua require('toggle-checkbox').toggle()<CR>",
        { silent = true, desc = "Toggle CheckBox" }
      )
    end,
  },
  { "jannis-baum/vivify.vim" },
}
