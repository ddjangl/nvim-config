return {
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
    -- Remember to change this to false if I want it to load
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      vim.keymap.set("n", "<leader>dc", function()
        require("dap").continue()
      end)
      vim.keymap.set("n", "<F10>", function()
        require("dap").step_over()
      end)
      vim.keymap.set("n", "<F11>", function()
        require("dap").step_into()
      end)
      vim.keymap.set("n", "<F12>", function()
        require("dap").step_out()
      end)
      vim.keymap.set("n", "<Leader>dt", function()
        require("dap").toggle_breakpoint()
      end)
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
  --   config = function()
  --     require("dap-cortex-debug").setup {
  --       debug = false, -- log debug messages
  --       -- path to cortex-debug extension, supports vim.fn.glob
  --       -- by default tries to guess: mason.nvim or VSCode extensions
  --       extension_path = nil,
  --       lib_extension = nil, -- shared libraries extension, tries auto-detecting, e.g. 'so' on unix
  --       node_path = "node", -- path to node.js executable
  --       dapui_rtt = true, -- register nvim-dap-ui RTT element
  --       -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
  --       dap_vscode_filetypes = { "c", "cpp" },
  --       rtt = {
  --         buftype = "Terminal", -- 'Terminal' or 'BufTerminal' for terminal buffer vs normal buffer
  --       },
  --     }
  --     local dap_cortex_debug = require "dap-cortex-debug"
  --     require("dap").configurations.c = {
  --       dap_cortex_debug.openocd_config {
  --         name = "Example debugging with OpenOCD",
  --         cwd = "${workspaceFolder}",
  --         executable = "${workspaceFolder}/build/FET_SRC_V1.elf",
  --         configFiles = { "${workspaceFolder}/build/openocd/connect.cfg" },
  --         gdbTarget = "localhost:3333",
  --         rttConfig = dap_cortex_debug.rtt_config(0),
  --         showDevDebugOutput = false,
  --       },
  --     }
  --     require("dapui").setup {
  --       layouts = {
  --         {
  --           position = "left",
  --           size = 96,
  --           elements = {
  --             { id = "scopes", size = 0.4 },
  --             { id = "rtt", size = 0.6 },
  --           },
  --         },
  --         -- (...)
  --       },
  --     }
  --   end,
  -- },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
