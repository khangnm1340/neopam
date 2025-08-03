return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "projekt0n/github-nvim-theme",
    config = function()
      local override = require("github-theme.override")

      override.palettes = {
        github_light_high_contrast = {
          blue = {
            base = "#000000",
          },
        },
      }
      require("github-theme").setup({
        palettes = override.palettes, -- Pass your overridden palettes
      })
    end,
  },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_light_high_contrast",
      -- colorscheme = "tokyonight",
    },
  },
}
