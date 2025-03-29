-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

---@diagnostic disable-next-line: undefined-field
if vim.g.neovide then
  vim.keymap.set(
    { "n", "v" },
    "<M-u>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
    { desc = "Increase font size" }
  )
  vim.keymap.set(
    { "n", "v" },
    "<M-U>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
    { desc = "Decrease font size" }
  )
  vim.keymap.set({ "n", "v" }, "<M-C-u>", ":lua vim.g.neovide_scale_factor = 1<CR>", { desc = "Reset font size" })

  vim.keymap.set("n", "<C-S-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-S-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-S-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-S-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- better up-down
vim.keymap.set({ "n", "x" }, "j", "gj", { desc = "Down", silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "gj", { desc = "Down", silent = true })
vim.keymap.set({ "n", "x" }, "k", "gk", { desc = "Up", silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "gk", { desc = "Up", silent = true })

vim.keymap.set("n", "<leader>pp", function()
  local current_file_path = vim.fn.expand("%:p")
  print(current_file_path)
end, { desc = "[P]rint current file [P]ath" })

-- Function to toggle the 'showtabline' option
local function toggle_tabline()
  if vim.o.showtabline == 0 then
    vim.o.showtabline = 2
  else
    vim.o.showtabline = 0
  end
end

-- Map 'ua' to toggle the tabline visibility
vim.keymap.set("n", "<leader>ua", toggle_tabline, { desc = "Toggle Tabline" })

--NOTE: FOLD
vim.keymap.set("n", "<C-Tab>", function()
  -- Get the current line number
  local line = vim.fn.line(".")
  -- Get the fold level of the current line
  local foldlevel = vim.fn.foldlevel(line)
  if foldlevel == 0 then
    vim.notify("No fold found", vim.log.levels.INFO)
  else
    vim.cmd("normal! za")
    vim.cmd("normal! zz") -- center the cursor line on screen
  end
end, { desc = "[P]Toggle fold" })
--NOTE: FOLD

vim.keymap.set("n", "<C-S-O>", ":b#<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ii", function()
  vim.opt.textwidth = 130
end, { desc = "increase textwidth to 130" })

vim.keymap.set("n", "<C-w>e", function()
  local filename = vim.fn.expand("%:p")
  vim.cmd("close")
  vim.cmd("e " .. filename)
end, { desc = "Open window in a new buffer" })

vim.keymap.set("n", "<C-a>", ":%y<CR>")
vim.keymap.set("n", "<leader>sR", ":GrugFarWithin<CR>", { noremap = true, silent = true, desc = "Search and replace" })

vim.keymap.set("n", "<leader>sr", function()
  require("snacks").picker.resume()
end, { desc = "Resume" })

vim.keymap.set("n", "<S-q>", "@q", { noremap = true, silent = true })

vim.keymap.set("n", "9", function()
  require("render-markdown").buf_toggle()
end)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("my-grug-far-custom-keybinds", { clear = true }),
  pattern = { "grug-far" },
  callback = function()
    vim.keymap.set("n", "<leader>k", function()
      require("grug-far").goto_prev_input()
    end, { buffer = true })
  end,
})
