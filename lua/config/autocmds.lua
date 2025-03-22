-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- local config_group = vim.api.nvim_create_augroup("MyConfigGroup", {}) -- A global group for all your config autocommands
--
-- vim.api.nvim_create_autocmd({ "User" }, {
--   pattern = "SessionLoadPost",
--   group = config_group,
--   callback = function()
--     require("harpoon")
--   end,
-- })
--

vim.api.nvim_set_hl(0, "colorcolumn", { bg = "#242b3d" })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.md" },
  callback = function()
    vim.opt.colorcolumn = "80"
    vim.opt.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = { "*.md" },
  callback = function()
    vim.opt.colorcolumn = ""
    vim.opt.textwidth = 0
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*.md",
  callback = function()
    vim.cmd("RenderMarkdown buf_toggle") -- Toggle back to rendered view (conceal level should be 3)
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*.md",
  callback = function()
    vim.cmd("RenderMarkdown buf_toggle") -- Toggle back to rendered view (conceal level should be 3)
  end,
})
