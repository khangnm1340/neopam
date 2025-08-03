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
    { desc = "Increase font size", silent = true }
  )
  vim.keymap.set(
    { "n", "v" },
    "<M-U>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
    { desc = "Decrease font size", silent = true }
  )
  vim.keymap.set(
    { "n", "v" },
    "<M-C-u>",
    ":lua vim.g.neovide_scale_factor = 1<CR>",
    { desc = "Reset font size", silent = true }
  )

  vim.keymap.set("n", "<C-S-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-S-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-S-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-S-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- better up-down
vim.keymap.set({ "n", "x" }, "j", "gj", { desc = "Down", silent = true })
vim.keymap.set({ "n", "x" }, "k", "gk", { desc = "Up", silent = true })

--NOTE: FOLD
-------------------------------------------------------------------------------
--                           Folding section
-------------------------------------------------------------------------------
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

function _G.markdown_foldexpr()
  local line = vim.fn.getline(vim.v.lnum)
  local heading_level = line:match("^(#+)%s")
  if heading_level then
    return ">" .. #heading_level
  else
    return "="
  end
end

local function set_markdown_folding()
  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "v:lua.markdown_foldexpr()"
  vim.opt_local.foldlevel = 99
end

-- Use autocommand to apply only to markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = set_markdown_folding,
})

--NOTE: FOLD
-------------------------------------------------------------------------------
--                           End Folding section
-------------------------------------------------------------------------------

vim.keymap.set("n", "<C-w>e", function()
  local filename = vim.fn.expand("%:p")
  vim.cmd("close")
  vim.cmd("e " .. filename)
end, { desc = "Open window in a new buffer" })

vim.keymap.set("n", "<C-a>", ":%y<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-a>", ":%d<CR>", { noremap = true, silent = true })

-- vim.keymap.del("n", "<Leader>sr")

-- vim.keymap.set("n", "<S-q>", "@q", { noremap = true, silent = true })

vim.keymap.set("n", "9", function()
  require("render-markdown").buf_toggle()
end)

function ToggleMouse()
  if vim.o.mouse == "" then
    vim.o.mouse = "a"
    vim.notify("Mouse enabled", vim.log.levels.INFO)
  else
    vim.o.mouse = ""
    vim.notify("Mouse disabled", vim.log.levels.INFO)
  end
end

-- To map this function to a keybinding (e.g., <Leader>m):
vim.keymap.set("n", "<Leader>rm", function()
  ToggleMouse()
end, { desc = "Toggle Mouse", silent = true })

function Toggle_opacity()
  if vim.g.neovide_opacity < 1 and vim.g.neovide_normal_opacity < 1 then
    vim.g.neovide_opacity = 1
    vim.g.neovide_normal_opacity = 1
    vim.notify("Opacity disabled", vim.log.levels.INFO)
  else
    vim.g.neovide_opacity = 0.9
    vim.g.neovide_normal_opacity = 0.85
    -- vim.g.neovide_opacity = 0.7
    -- vim.g.neovide_normal_opacity = 0.5
    vim.notify("Opacity enabled", vim.log.levels.INFO)
  end
end

-- vim.keymap.set("n", "<Leader>ro", function()
--   Toggle_opacity()
-- end, { desc = "Toggle opacity", silent = true })

vim.keymap.del("n", "gcc")
vim.keymap.del("n", "gco")
vim.keymap.del("n", "gcO")

-- delete to the end of lin
vim.keymap.set("i", "<C-k>", "lC", { noremap = true, silent = true })
vim.keymap.set("n", "L", ":b#<CR>", { noremap = true, silent = true })
