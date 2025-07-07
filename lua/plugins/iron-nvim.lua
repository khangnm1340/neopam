-- /home/pampam/.config/nvim/lua/plugins/iron-nvim.lua

-- You should not 'require' the plugin directly at the top level
-- of this file if this file is meant to be a plugin specification
-- for Lazy.nvim. Lazy.nvim handles the loading.

return {
  "Vigemus/iron.nvim", -- This is the standard way to specify the plugin for Lazy.nvim
  -- enabled = false,
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Iron often benefits from treesitter

  -- This `config` function will be called by Lazy.nvim *after* the plugin is loaded
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "bash" },
          },
          python = {
            command = { "ipython", "--no-autoindent" }, -- or { "ipython", "--no-autoindent" }
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
          },
        },
        -- set the file type of the newly created repl to ft
        -- bufnr is the buffer id of the REPL and ft is the filetype of the
        -- language being used for the REPL.
        repl_filetype = function(bufnr, ft)
          return ft
          -- or return a string name such as the following
          -- return "iron"
        end,
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = {
          view.split.vertical.rightbelow("%40"),
        },
        -- repl_open_cmd = view.bottom(40),

        -- repl_open_cmd can also be an array-style table so that multiple
        -- repl_open_commands can be given.
        -- When repl_open_cmd is given as a table, the first command given will
        -- be the command that `IronRepl` initially toggles.
        -- Moreover, when repl_open_cmd is a table, each key will automatically
        -- be available as a keymap (see `keymaps` below) with the names
        -- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
        -- For example,
        --
        -- repl_open_cmd = {
        --    view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
        --    view.split.rightbelow("%25")    -- cmd_2: open a repl below
        -- }
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        toggle_repl = "<leader>rj", -- toggles the repl open and closed.
        -- If repl_open_cmd is a table as above, then the following keymaps are
        -- available
        -- toggle_repl_with_cmd_1 = "<leader>rj",
        -- toggle_repl_with_cmd_2 = "<leader>rh",
        restart_repl = "<leader>R", -- calls `IronRestart` to restart the repl
        send_motion = "<leader>rk",
        visual_send = "<leader>rk",
        send_file = "<leader>rf",
        send_line = "<leader>rl",
        send_paragraph = "<leader>rp",
        send_until_cursor = "<leader>ru",
        -- send_mark = "<leader>rm",
        send_code_block = "<leader>rb",
        send_code_block_and_move = "<leader>rn",
        -- mark_motion = "<leader>mc",
        -- mark_visual = "<leader>mc",
        -- remove_mark = "<leader>md",
        cr = "<leader>s<cr>",
        interrupt = "<leader>s<leader>", -- Changed <space> to <leader> as per your request
        exit = "<leader>sq",
        clear = "<leader>rc",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    })

    -- iron also has a list of commands, see :h iron-commands for all available commands
    -- Init = function()
    --   vim.keymap.set("n", "<leader>rr", "<cmd>IronFocus<cr>") -- Use <cmd> for better practice
    --   vim.keymap.set("n", "<leader>re", "<cmd>IronHide<cr>") -- Use <cmd> for better practice
    -- end
  end,
}
