return {
  "mfussenegger/nvim-lint",
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost" },
    linters_by_ft = {
      cpp = { "cpplint" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
      -- ["*"] = { "typos" },
    },
    ---@type table<string,table>
    linters = {
      cpplint = {
        args = { "--filter=-legal/copyright" },
      },
    },
  },
}
