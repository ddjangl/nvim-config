return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
      -- vim.keymap.set("n", "<leader>dc", function()
      --   require("dap").continue()
      -- end)
      -- vim.keymap.set("n", "<F10>", function()
      --   require("dap").step_over()
      -- end)
      -- vim.keymap.set("n", "<F11>", function()
      --   require("dap").step_into()
      -- end)
      -- vim.keymap.set("n", "<F12>", function()
      --   require("dap").step_out()
      -- end)
      -- vim.keymap.set("n", "<Leader>db", function()
      --   require("dap").toggle_breakpoint()
      -- end)
      -- vim.keymap.set("n", "<Leader>dB", function()
      --   require("dap").set_breakpoint()
      -- end)
      -- vim.keymap.set("n", "<Leader>dr", function()
      --   require("dap").repl.open()
      -- end)
      -- vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      --   require("dap.ui.widgets").hover()
      -- end)
      -- vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
      --   require("dap.ui.widgets").preview()
      -- end)
      -- vim.keymap.set("n", "<Leader>df", function()
      --   local widgets = require "dap.ui.widgets"
      --   widgets.centered_float(widgets.frames)
      -- end)
      -- vim.keymap.set("n", "<Leader>ds", function()
      --   local widgets = require "dap.ui.widgets"
      --   widgets.centered_float(widgets.scopes)
      -- end)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require "dap", require "dapui"
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
    end,
  },
  -- {
  --   "jedrzejboczar/nvim-dap-cortex-debug",
  --   lazy = false,
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --   },
  --   config = function()
  --     local dap_cortex_debug = require "dap-cortex-debug"
  --     dap_cortex_debug.setup {
  --       debug = false, -- log debug messages
  --       -- path to cortex-debug extension, supports vim.fn.glob
  --       -- by default tries to guess: mason.nvim or VSCode extensions
  --       extension_path = "/home/nick_s/.local/share/nvim/mason/packages/cortex-debug/extension/",
  --       lib_extension = nil, -- shared libraries extension, tries auto-detecting, e.g. 'so' on unix
  --       node_path = "node", -- path to node.js executable
  --       dapui_rtt = true, -- register nvim-dap-ui RTT element
  --       -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
  --       dap_vscode_filetypes = { "c", "cpp" },
  --       rtt = {
  --         buftype = "Terminal", -- 'Terminal' or 'BufTerminal' for terminal buffer vs normal buffer
  --       },
  --     }
  --     require("dap").configurations.c = {
  --       dap_cortex_debug.openocd_config {
  --         name = "FET Board Debugger",
  --         cwd = "${workspaceFolder}",
  --         executable = "${workspaceFolder}/build/FET_SRC_V1.elf",
  --         configFiles = { "${workspaceFolder}/openocd.cfg" },
  --         gdbTarget = "localhost:3333",
  --         rttConfig = dap_cortex_debug.rtt_config(0),
  --         showDevDebugOutput = false,
  --       },
  --     }
  --   end,
  -- },
}
