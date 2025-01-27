-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

---@diagnostic disable-next-line: undefined-field
if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<M-u>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<M-U>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<M-C-u>", ":lua vim.g.neovide_scale_factor = 1<CR>")

  vim.keymap.set("n", "<C-S-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-S-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-S-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-S-v>", '<ESC>l"+Pli') -- Paste insert mode
end

vim.keymap.set("n", "<leader>qs", ":SessionManager load_session<CR>", { desc = "Load Session" })
vim.keymap.set("n", "<leader>ql", ":SessionManager load_last_session<CR>", { desc = "Load Last Session" })
vim.keymap.set("n", "<leader>qd", ":SessionManager delete_session<CR>", { desc = "Delete Session" })
vim.keymap.set("n", "<C-q>", ":SessionManager save_current_session<CR>", { desc = "Save Current Session" })

--- unbind toggle animate(ua)
--- change uA to ua
--- 3 diagnostic missing fields
--- uncomment better up-down
