return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("tokyonight").setup({
      on_highlights = function(hl, colors)
        -- Override the @markup.heading.1.markdown highlight group
        hl["@markup.heading.1.markdown"] = {
          bold = true,
          fg = "#24fbde", -- Your custom color
        }
        hl["@markup.heading.2.markdown"] = {
          bold = true,
          fg = "#f6a007", -- Your custom color
        }
        hl["@markup.heading.3.markdown"] = {
          bold = true,
          fg = "#81f737", -- Your custom color
        }
        hl["@markup.heading.4.markdown"] = {
          bold = true,
          fg = "#c67cf8", -- Your custom color
        }
      end,
    })
  end,
}
