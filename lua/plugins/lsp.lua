---@diagnostic disable: missing-fields
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    require("nvim-dap-virtual-text").setup()
    require("lazydev").setup({
      library = { "nvim-dap-ui" },
    })

    local dap = require("dap")

    dap.adapters.codelldb = {
      type = "executable",
      command = "/home/pampam/.local/share/nvim/mason/bin/codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

      -- On windows you may have to uncomment this:
      -- detached = false,
      args = {
        "--settings",
        vim.json.encode({
          showDisassembly = "never", -- You can also use "auto" or "always"
        }),
      },
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          -- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/lia", "file")
          return vim.fn.getcwd() .. "/lia"
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "/usr/bin/python"
        end,
      },
    }

    vim.keymap.set("n", "<F5>", function()
      require("dapui").open()
      require("dap").continue()
    end)
    vim.keymap.set("n", "<F1>", function()
      require("dap").step_over()
    end)
    vim.keymap.set("n", "<F2>", function()
      require("dap").step_into()
    end)
    vim.keymap.set("n", "<F3>", function()
      require("dap").step_out()
    end)
    vim.keymap.set("n", "<Leader>da", function()
      require("dap").toggle_breakpoint()
    end, { desc = "toggle breakpoint" })
    vim.keymap.set("n", "<Leader>ds", function()
      require("dap").clear_breakpoints()
    end, { desc = "clear all breakpoints" })
    vim.keymap.set("n", "<Leader>dd", function()
      require("dap").disconnect()
    end, { desc = "disconnect" })
    vim.keymap.set("n", "<Leader>dj", function()
      require("dap").clear_breakpoints()
      require("dap").disconnect()
      require("dapui").close()
    end, { desc = "stoppu" })
    vim.keymap.set("n", "<F6>", function()
      require("dap").restart()
    end, { desc = "restart" })

    require("dapui").setup({

      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.50,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "left",
          size = 50,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 10,
        },
      },
    })

    vim.keymap.set("n", "<Leader>du", function()
      require("dapui").toggle()
    end, { desc = "Toggle DAP UI" })

    -- local KEYPY = false
    -- if KEYPY then
    --   vim.keymap.set("n", "<F6>", function()
    --     require("dap-python").test_method()
    --   end)
    --   vim.keymap.set("n", "<F7>", function()
    --     require("dap-python").test_class()
    --   end)
    -- end
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "red", linehl = "", numhl = "" })
  end,
}
