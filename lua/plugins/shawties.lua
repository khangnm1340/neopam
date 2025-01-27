return {
  {
    "Shatur/neovim-session-manager",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      local config = require("session_manager.config")
      require("session_manager").setup({
        -- Define what to do when Neovim is started without
        -- arguments. See "Autoload mode" section below.
        autoload_mode = config.AutoloadMode.LastSession,
        -- Automatically save last session on exit and on session switch.
        autosave_last_session = false,
      })
    end,
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>uu", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
}
