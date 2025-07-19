return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      json = { "jq" },
      -- html = { "djlint" },
      htmldjango = { "djlint" },
      -- Add "pgformatter" for SQL files
      sql = { "pgformatter" },
      csharp = { "csharpier" },
      toml = { "taplo" },
    },
    formatters = {
      taplo = {
        command = "taplo",
        args = { "format", "-" },
        cwd = require("conform.util").root_file({ "taplo.toml" }),
      },
      -- Configuration for the "jq" formatter
      jq = {
        command = "jq",
        -- Specify arguments to indent with 2 spaces
        args = { "--indent", "2", "." },
      },
      -- Configuration for the "pgformatter"
      pgformatter = {
        command = "pg_format",
        args = { "--no-extra-line" },
      },
      csharpier = {
        args = {
          "format",
          "--write-stdout",
        },
      },
      djlint = {
        command = "djlint",
        args = { "--reformat", "-" },
      },
    },
  },
}
