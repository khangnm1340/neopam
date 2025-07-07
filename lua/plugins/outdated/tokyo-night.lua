local M = {}
---@diagnostic disable-next-line: missing-fields
require("tokyonight").setup({
  -- enabled = false,
  -- transparent = true,
  style = "storm",
  on_highlights = function(hl)
    -- Override the @markup.heading.1.markdown highlight group
    hl["@markup.heading.1.markdown"] = {
      bold = true,
      fg = "#24fbde", -- Your custom color
    }
    hl["@markup.heading.2.markdown"] = {
      bold = true,
      fg = "#E2B4BD", -- Your custom color
    }
    hl["@markup.heading.3.markdown"] = {
      bold = true,
      fg = "#F6511D", -- Your custom color
    }
    hl["@markup.heading.4.markdown"] = {
      bold = true,
      fg = "#c67cf8", -- Your custom color
    }
  end,
})

return M
