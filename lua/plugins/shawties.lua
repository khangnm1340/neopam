---@diagnostic disable: undefined-doc-name
return {
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
    opts = { ensure_installed = { "clang-format", "codelldb", "cpplint", "debugpy", "marksman" } },
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
      highlight = {
        -- backdrop = false,
      },
      modes = {
        char = {
          jump_labels = true,
          label = { exclude = "o" },
          multi_line = false,
        },
      },
    },
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter({labels = "jkluiohprewtfdsgvmcbxqy"}) end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      },
  },
  {
    "oskarrrrrrr/symbols.nvim",
    config = function()
      local r = require("symbols.recipes")
      require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
        -- custom settings here
        -- e.g. hide_cursor = false
      })
      vim.keymap.set("n", "<leader>ds", "<cmd> Symbols<CR>", { desc = "Symbols" })
      vim.keymap.set("n", "<leader>dS", "<cmd> SymbolsClose<CR>", { desc = "SymbolsClose" })
    end,
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
}
