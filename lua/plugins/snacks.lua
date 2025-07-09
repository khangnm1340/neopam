---@diagnostic disable: undefined-global
return
-- lazy.nvim
{
  {
    "folke/snacks.nvim",
    priority = 1000,

    opts = {
      dashboard = { enabled = false },
      picker = {
      -- stylua: ignore start
      exclude = { "CurseForge", "discord", "google-chrome", "legcord", "chromium", "Cursor", "obsidian", "pgadmin4", "vesktop", "tmp_files", "GIMP", "zathura", "Code - OSS", "Google", "calibre", "libreoffice", "wezterm", "tmux/plugins", "nvim.bak", "obs-studio", "shaders", "presets", "Vencord","playlists" },

        -- stylua: ignore end
        layout = {
          preset = "ivy_split",
        },
        win = {
          -- input window
          input = {
            keys = {
              ["<A-k>"] = { "cycle_win", mode = { "n", "i" } },
            },
          },
        },
      },
    },
    keys = {

      { "<leader>fF", false },
      {
        "<leader>;",
        ft = { "markdown" },
        function()
          Snacks.image.hover()
        end,
        desc = "Preview math formula under cursor",
      },
      {
        "<leader>ff",
        function()
          require("snacks.picker").files({
            cwd = vim.fn.getcwd(), -- Explicitly set cwd to current working directory
            -- You can add other options here if needed, e.g., exclude
            -- exclude = { "node_modules", ".git" },
          })
        end,
        desc = "Find files in CWD (Snacks.nvim)",
      },

      {
        "<leader>fC",
        function()
          require("snacks.picker").files({ cwd = vim.fn.expand("~/.config") })
        end,
        desc = "Find files in ~/.config (Snacks.nvim)",
      },
      {
        "<leader>fj", -- 'z' for zoxide
        function()
          require("snacks.picker").zoxide()
        end,
        desc = "Open zoxide directory picker (Snacks.nvim)",
      },
    },
  },
  -- Lua
  {
    "olimorris/persisted.nvim",
    event = "VimEnter", -- Ensure the plugin loads only when a buffer has been loaded
    opts = {
      ignore_dirs = { vim.fn.expand("~"), exact = true },
    },
    keys = {
      { "<leader>qs", "<cmd>SessionSave<CR>|<cmd>SessionSelect<CR>", desc = "Load Session" },
      -- Key for loading the last session
      { "<leader>ql", "<cmd>SessionLoadLast<CR>", desc = "Load Last Session" },
      -- Key for deleting the current session
      { "<leader>qd", "<cmd>SessionDelete<CR>", desc = "Delete Session" },
    },
  },
}
