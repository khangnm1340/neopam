-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/render-markdown.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/render-markdown.lua

-- https://github.com/MeanderingProgrammer/markdown.nvim
--
-- When I hover over markdown headings, this plugins goes away, so I need to
-- edit the default highlights
-- I tried adding this as an autocommand, in the options.lua
-- file, also in the markdownl.lua file, but the highlights kept being overriden
-- so the inly way is the only way I was able to make it work was loading it
-- after the config.lazy in the init.lua file lamw25wmal

-- Require the colors.lua module and access the colors directly without
-- additional file reads
-- local colors = require("config.colors")

return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- enabled = false,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        indent = { enable = false },
      },
    },
    "echasnovski/mini.nvim",
  }, -- if you use the mini.nvim suite
  -- Moved highlight creation out of opts as suggested by plugin maintainer
  -- There was no issue, but it was creating unnecessary noise when ran
  -- :checkhealth render-markdown
  -- https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/138#issuecomment-2295422741
  init = function()
    -- Define color variables
    local color1_bg = "#24fbde"
    local color2_bg = "#E2B4BD"
    local color3_bg = "#F6511D"
    local color4_bg = "#c67cf8"
    local color5_bg = "#0f857c"
    local color6_bg = "#396592"
    local color_fg = "#000000" -- Foreground Color
    -- local color_sign = "#ebfafa"
    -- Heading colors (when HOVERED over), extends through the entire line
    vim.cmd(string.format([[highlight @markup.heading.1.markdown cterm=bold gui=bold guifg=%s]], color1_bg))

    -- Heading colors (when not hovered over), extends through the entire line
    vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg))
    vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color_fg, color2_bg))
    vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color_fg, color3_bg))
    vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color_fg, color4_bg))
    vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color_fg, color5_bg))
    vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color_fg, color6_bg))

    -- Highlight for the heading and sign icons (symbol on the left)
    -- I have the sign disabled for now, so this makes no effect
    vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg))
    vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg))
    vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg))
    vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg))
    vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg))
    vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg))
  end,
  opts = {
    pipe_table = {
      -- Turn on / off pipe table rendering.
      enabled = false,
    },

    dash = {
      -- Turn on / off thematic break rendering.
      enabled = false,
    },
    preset = "lazy",
    win_options = {
      conceallevel = { default = 0, rendered = 3 },
    },

    bullet = {
      -- Turn on / off list bullet rendering
      enabled = false,
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = false,
    },

    html = {
      -- Turn on / off all HTML rendering
      enabled = false,
      comment = {
        -- Turn on / off HTML comment concealing
        conceal = false,
      },
    },
    heading = {
      sign = true,
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      backgrounds = {
        "Headline1Bg",
        "Headline2Bg",
        "Headline3Bg",
        "Headline4Bg",
        "Headline5Bg",
        "Headline6Bg",
      },
      foregrounds = {
        "Headline1Fg",
        "Headline2Fg",
        "Headline3Fg",
        "Headline4Fg",
        "Headline5Fg",
        "Headline6Fg",
      },
    },
  },
  file_types = { "markdown" },
}
