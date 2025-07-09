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

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedSelectPre",
  callback = function()
    vim.cmd("%bd")
  end,
})
