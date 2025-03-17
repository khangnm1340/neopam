return
-- lazy.nvim
{
  "folke/snacks.nvim",
  priority = 1000,

  keys = {
    {
      "<leader>j",
      ft = { "markdown" },
      function()
        Snacks.image.hover()
      end,
      desc = "Preview math formula under cursor",
    },
    opts = {
      image = {
        -- enabled = true,
        -- your image configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- doc = {
        --
        --   enabled = true, -- Keep image support enabled for documents
        --   inline = false, -- Disable inline image rendering
        --   float = false, -- Disable floating image rendering
        -- },
      },
    },
  },
}
