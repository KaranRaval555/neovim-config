return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- UI setup
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- KEYMAPS
    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debug" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step Out" })

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.expand("~/.local/share/nvim/dap/js-debug/src/dapDebugServer.js"),
          "${port}",
        },
      },
    }

    -- JavaScript
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch current file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
      },
    }

    -- TypeScript (same adapter!)
    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch TS file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        outFiles = { "${workspaceFolder}/**/*.js" },
      },
    }
  end,
}
