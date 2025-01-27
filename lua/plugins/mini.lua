return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.files").setup({
        vim.keymap.set("n", "<leader>e", function()
          MiniFiles.open()
        end, { desc = "Mini Files" }),
        mappings = {
          go_in = "L",
          go_out = "H",
          go_in_plus = "",
          go_out_plus = "",
        },
        windows = {
          preview = true, -- Width of focused window
          width_focus = 40,
          -- Width of non-focused window
          width_nofocus = 20,
          -- Width of preview window
          width_preview = 75,
        },
      })
    end,
  },
}
