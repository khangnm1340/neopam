
```keymap.lua
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

vim.keymap.set("n", "<leader>ii", function()
  vim.opt.textwidth = 130
end, { desc = "increase textwidth to 130" })
```

```autocmds.lua
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("my-grug-far-custom-keybinds", { clear = true }),
  pattern = { "grug-far" },
  callback = function()
    vim.keymap.set("n", "<leader>k", function()
      require("grug-far").goto_prev_input()
    end, { buffer = true })
  end,
})
```
