local M = {}
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    json = { "jq" }, -- Add jq for JSON files
  },
  formatters = {
    jq = {
      command = "jq",
      args = { "--indent", "2", "." }, -- Specify indent width here
    },
  },
  -- other conform.nvim settings
})
return M
