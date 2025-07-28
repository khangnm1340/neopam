local M = {}

local function create_session()
  vim.ui.input({ prompt = "Enter new session name: " }, function(new_name)
    if new_name then
      vim.cmd("%bd")
      MiniSessions.write(new_name, { force = true })
      print("Session created with name: " .. new_name)
      vim.cmd("enew")
    else
      print("Session creation cancelled.")
    end
  end)
end

local config = {
  directory = vim.fn.stdpath("data") .. "/sessions", -- For global sessions
  hooks = {
    post = {
      read = function()
        local current_buf_filetype = vim.bo.filetype
        if current_buf_filetype == "markdown" then
          vim.opt.colorcolumn = "80"
          vim.opt.textwidth = 80
        end
      end,
    },
  },
}

if vim.g.neovide then
  config.autoread = true
end

require("mini.sessions").setup(config)

local config_session_name = "config.vim"
local notes_session_name = "Daily_Notes.vim"
local data_mining = "data_mining"
local session_session_name = "nvim_session.vim"

vim.keymap.set("n", "<leader>qs", ":lua MiniSessions.select('read')<CR>", { desc = "Load Session", silent = true })
vim.keymap.set("n", "<C-S-I>", ":lua MiniSessions.read()<CR>", { desc = "Load Last Session", silent = true })
vim.keymap.set("n", "<leader>qd", ":lua MiniSessions.select('delete')<CR>", { desc = "Delete Session" })

vim.keymap.set("n", "<C-S-J>", function()
  require("mini.sessions").read(config_session_name)
end, { desc = "Switch to config session" })
vim.keymap.set("n", "<C-S-K>", function()
  require("mini.sessions").read(notes_session_name)
end, { desc = "Switch to notes session" })
vim.keymap.set("n", "<C-S-L>", function()
  require("mini.sessions").read(data_mining)
end, { desc = "Switch to data_mining session" })

vim.api.nvim_create_user_command("CreateSession", create_session, {}) -- No args
vim.keymap.set("n", "<leader>qc", ":CreateSession<CR>", { desc = "Create Session" })
--directory = "~/.config/nvim/sessions",
return M
