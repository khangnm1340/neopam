return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pgformatter",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        djlsp = {},
      },
      setup = {
        djlsp = function(_, opts)
          vim.list_extend(opts, {
            cmd = { "djlsp" },
            init_options = {
              django_settings_module = "library_management.settings", -- IMPORTANT: Replace this!
            },
            filetypes = { "htmldjango" },
            root_dir = require("lspconfig.util").root_pattern("manage.py", ".git"),
          })
          require("lspconfig").djlsp.setup(opts) -- Pass the modified opts to setup
        end,
      },
    },
  },
}
