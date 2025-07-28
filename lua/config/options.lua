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
-- opt.mouse = "" --disable mouse

-- vim.g.neovide_opacity = 0.9
-- vim.g.neovide_normal_opacity = 0.85
-- vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_trail_size = 1
vim.g.neovide_cursor_animation_length = 0.1

vim.g.neovide_hide_mouse_when_typing = true

vim.api.nvim_set_keymap("v", "p", "P", { noremap = true, silent = true })
-- vim.o.background = "dark"
vim.o.background = "light"

vim.opt.shell = "bash"
vim.opt.shellcmdflag = "-c"
