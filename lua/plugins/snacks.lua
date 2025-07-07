---@diagnostic disable: undefined-global
return
-- lazy.nvim
{
  {
    "folke/snacks.nvim",
    priority = 1000,

    opts = {
      picker = {
      -- stylua: ignore start
      exclude = { "CurseForge", "discord", "google-chrome", "legcord", "chromium", "Cursor", "obsidian", "pgadmin4", "vesktop", "tmp_files", "GIMP", "zathura", "Code - OSS", "Google", "calibre", "libreoffice", "wezterm", "tmux/plugins", "nvim.bak", "obs-studio", "shaders", "presets", "Vencord","playlists" },

        -- stylua: ignore end
        layout = {
          preset = "ivy_split",
        },
      },
    },
    keys = {
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
        "<leader>fj", -- 'z' for zoxide
        function()
          require("snacks.picker").zoxide()
        end,
        desc = "Open zoxide directory picker (Snacks.nvim)",
      },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").select() end,desc = "Select Session" },
  },
  },
}
