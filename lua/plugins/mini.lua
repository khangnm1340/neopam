return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.files").setup({
        vim.keymap.set("n", "<leader>r", function()
          MiniFiles.open()
        end, { desc = "Mini Files" }),

        vim.keymap.set("n", "<leader>e", function()
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end, { desc = "Mini Current Dir" }),

        mappings = {
          go_in = "", -- Disable default 'l' mapping
          go_out = "h",
          go_in_plus = "",
          go_out_plus = "",
        },
        windows = {
          preview = true, -- Width of focused window
          width_focus = 40,
          -- Width of non-focused window
          width_nofocus = 20,
          -- Width of preview window
          width_preview = 75,
        },
        -- Custom key mappings for mini.files
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniFilesBufferCreate",
          callback = function(args)
            local buf_id = args.data.buf_id

            -- Map 'l' to do nothing on files
            vim.keymap.set("n", "l", function()
              local fs_entry = MiniFiles.get_fs_entry()
              if fs_entry and fs_entry.fs_type == "directory" then
                MiniFiles.go_in()
              end
            end, { buffer = buf_id })

            -- Map 'Enter' to open files
            vim.keymap.set("n", "<Tab>", function()
              local fs_entry = MiniFiles.get_fs_entry()
              if fs_entry and fs_entry.fs_type == "file" then
                MiniFiles.go_in()
              end
            end, { buffer = buf_id })
          end,
        }),
      })
    end,
  },
}
