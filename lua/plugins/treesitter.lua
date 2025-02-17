return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      indent = {
        enable = false,
      },
    })
  end,
}
