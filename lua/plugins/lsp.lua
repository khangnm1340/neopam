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
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<C-k>", false, mode = { "i" } }
      -- stylua: ignore
      keys[#keys + 1] = { "gk", function() return vim.lsp.buf.signature_help() end, mode = { "n" }, }
      -- stylua: ignore
      keys[#keys + 1] = { "<C-l>", function() return vim.lsp.buf.signature_help() end, mode = { "i" }, }
    end,
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
