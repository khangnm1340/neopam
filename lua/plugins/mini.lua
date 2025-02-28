return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.files").setup({
        --copy file path
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniFilesBufferCreate",
          callback = function(args)
            local buf_id = args.data.buf_id
            vim.keymap.set("n", "<C-c>", function()
              -- Get the current entry (file or directory)
              local curr_entry = MiniFiles.get_fs_entry()
              if curr_entry then
                -- Convert path to be relative to home directory
                local home_dir = vim.fn.expand("~")
                local relative_path = curr_entry.path:gsub("^" .. home_dir, "~")
                vim.fn.setreg("+", relative_path) -- Copy the relative path to the clipboard register
                vim.notify(vim.fn.fnamemodify(relative_path, ":t"), vim.log.levels.INFO)
                vim.notify("Path copied to clipboard: ", vim.log.levels.INFO)
              else
                vim.notify("No file or directory selected", vim.log.levels.WARN)
              end
            end, { buffer = buf_id, noremap = true, silent = true, desc = "Copy relative path to clipboard" })
          end,
        }),
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

      -- Setup
      local gen_loader = require("mini.snippets").gen_loader
      require("mini.snippets").setup({
        snippets = {
          enabled = false,
          -- Load custom file with global snippets first
          gen_loader.from_file("~/.config/nvim/snippets/global.json"),

          -- Load snippets based on current language by reading files from
          -- "snippets/" subdirectories from 'runtimepath' directories.
          gen_loader.from_lang(),
        },
      })
    end,
  },
}
