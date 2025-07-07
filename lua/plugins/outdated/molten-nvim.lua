return {
  {
    "benlubas/molten-nvim",
    enabled = false,
    -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "none"
      vim.g.molten_auto_init_behavior = "init"
      vim.g.molten_enter_output_behavior = "open_and_enter"
      vim.g.molten_auto_image_popup = false
      vim.g.molten_auto_open_output = true
      vim.g.molten_output_floating = false
      vim.g.molten_split_direction = "right"
      vim.g.molten_output_crop_border = false
      vim.g.molten_output_virt_lines = true
      vim.g.molten_output_win_max_height = 50
      vim.g.molten_output_win_style = "minimal"
      vim.g.molten_output_win_hide_on_leave = false
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_virt_text_max_lines = 10000
      vim.g.molten_cover_empty_lines = false
      vim.g.molten_copy_output = false
      vim.g.molten_output_show_exec_time = false
    end,

    keys = {
      { "<leader>me", ":MoltenEvaluateLine<CR>", desc = "Molten: Evaluate Line" },
      { "<leader>mv", ":MoltenEvaluateVisual<CR>", desc = "Molten: Evaluate Visual Selection" },
      { "<leader>mr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" } },
      { "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "molten init" } },
      { "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true } },
      { "<leader>md", ":MoltenDelete<CR>", { desc = "open output window", silent = true } },
    },
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    enabled = false,
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
}
