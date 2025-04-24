-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false --true
---@diagnostic disable-next-line: undefined-global
LazyVim.terminal.setup("nu")

local opt = vim.opt

opt.number = false -- Print line number
opt.relativenumber = false -- Relative line numbers
opt.wrap = true --false -- Disable line wrap
opt.swapfile = false --disable swapfile
opt.shiftwidth = 6
opt.mouse = "" --disable mouse

vim.g.neovide_opacity = 0.93
vim.g.neovide_normal_opacity = 0.8

vim.g.neovide_hide_mouse_when_typing = true
