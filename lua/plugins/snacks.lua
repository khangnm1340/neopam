---@diagnostic disable: undefined-global
return
-- lazy.nvim
{
  "folke/snacks.nvim",
  priority = 1000,

  opts = {
    picker = {
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
  },
}
