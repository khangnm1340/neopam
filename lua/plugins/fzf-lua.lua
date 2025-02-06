return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "echasnovski/mini.icons" },
  opts = {

    "hide",
    winopts = {
      -- split = "belowright new",-- open in a split instead?
      -- "belowright new"  : split below
      -- "aboveleft new"   : split above
      -- "belowright vnew" : split right
      -- "aboveleft vnew   : split left
      -- Only valid when using a float window
      -- (i.e. when 'split' is not defined, default)
      height = 0.80, -- window height
      width = 0.70, -- window width
      row = 0.35, -- window row position (0=top, 1=bottom)
      col = 0.50, -- window col position (0=left, 1=right)
      -- border argument passthrough to nvim_open_win()
      border = "rounded",
      -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
      backdrop = 60,
      -- title         = "Title",
      -- title_pos     = "center",        -- 'left', 'center' or 'right'
      -- title_flags   = false,           -- uncomment to disable title flags
      fullscreen = false, -- start fullscreen?
      -- enable treesitter highlighting for the main fzf window will only have
      -- effect where grep like results are present, i.e. "file:line:col:text"
      -- due to highlight color collisions will also override `fzf_colors`
      -- set `fzf_colors=false` or `fzf_colors.hl=...` to override
      treesitter = {
        enabled = true,
        fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
      },
      preview = {
        -- default     = 'bat',           -- override the default previewer?
        -- default uses the 'builtin' previewer
        border = "rounded", -- preview border: accepts both `nvim_open_win`
        -- and fzf values (e.g. "border-top", "none")
        -- native fzf previewers (bat/cat/git/etc)
        -- can also be set to `fun(winopts, metadata)`
        wrap = false, -- preview line wrap (fzf's 'wrap|nowrap')
        hidden = false, -- start preview hidden
        vertical = "up:60%", -- up|down:size
        horizontal = "right:60%", -- right|left:size
        layout = "vertical", -- horizontal|vertical|flex
        flip_columns = 100, -- #cols to switch to horizontal on flex
        -- Only used with the builtin previewer:
        title = true, -- preview border title (file/buf)?
        title_pos = "center", -- left|center|right, title alignment
        scrollbar = "float", -- `false` or string:'float|border'
        -- float:  in-window floating border
        -- border: in-border "block" marker
        scrolloff = -1, -- float scrollbar offset from right
        -- applies only when scrollbar = 'float'
        delay = 20, -- delay(ms) displaying the preview
        -- prevents lag on fast scrolling
        winopts = { -- builtin previewer window options
          number = true,
          relativenumber = false,
          cursorline = true,
          cursorlineopt = "both",
          cursorcolumn = false,
          signcolumn = "no",
          list = false,
          foldenable = false,
          foldmethod = "manual",
        },
      },
      on_create = function()
        -- called once upon creation of the fzf main window
        -- can be used to add custom fzf-lua mappings, e.g:
        --   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
      end,
      -- called once _after_ the fzf interface is closed
      -- on_close = function() ... end
    },
    keymap = {
      -- Below are the default binds, setting any value in these tables will override
      -- the defaults, to inherit from the defaults change [1] from `false` to `true`
      builtin = {
        -- neovim `:tmap` mappings for the fzf win
        -- true, -- uncomment to inherit all the below in your custom config
        ["<M-h>"] = "toggle-help",
        ["<M-l>"] = "toggle-fullscreen",
        -- Only valid with the 'builtin' previewer
        ["<M-i>"] = "toggle-preview-wrap",
        ["<M-o>"] = "toggle-preview",
        ["<M-S-k>"] = "preview-page-up",
        ["<M-S-j>"] = "preview-page-down",
      },
      fzf = {

        -- fzf '--bind=' options
        -- true, -- uncomment to inherit all the below in your custom config
        ["ctrl-z"] = "abort",
        ["ctrl-u"] = "unix-line-discard",
        ["ctrl-f"] = "half-page-down",
        ["ctrl-b"] = "half-page-up",
        ["ctrl-a"] = "beginning-of-line",
        ["ctrl-e"] = "end-of-line",
        ["alt-a"] = "toggle-all",
        ["alt-g"] = "first",
        ["alt-G"] = "last",
        -- Only valid with fzf previewers (bat/cat/git/etc)
        ["f3"] = "toggle-preview-wrap",
        ["f4"] = "toggle-preview",
        ["alt-j"] = "down", -- CTRL-J moves the selection down
        ["alt-k"] = "up", -- CTRL-K moves the selection up
      },
    },
  },
}
