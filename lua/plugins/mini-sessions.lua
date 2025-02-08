local M = {}

local function create_session()
  vim.ui.input({ prompt = "Enter new session name: " }, function(new_name)
    if new_name then
      MiniSessions.write(new_name, { force = true })
      print("Session created with name: " .. new_name)
    else
      print("Session creation cancelled.")
    end
  end)
end

local config = {
  directory = vim.fn.stdpath("data") .. "/sessions", -- For global sessions
}

if vim.g.neovide then
  config.autoread = true
end

require("mini.sessions").setup(config)

vim.keymap.set("n", "<leader>qs", ":lua MiniSessions.select('read')<CR>", { desc = "Load Session" })
vim.keymap.set("n", "<leader>ql", ":lua MiniSessions.read()<CR>", { desc = "Load Last Session" })
vim.keymap.set("n", "<leader>qd", ":lua MiniSessions.select('delete')<CR>", { desc = "Delete Session" })

vim.api.nvim_create_user_command("CreateSession", create_session, {}) -- No args
vim.keymap.set("n", "<leader>qc", ":CreateSession<CR>", { desc = "Create Session" })
--directory = "~/.config/nvim/sessions",
return M
