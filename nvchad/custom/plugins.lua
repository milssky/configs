local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

       -- low level
        "c",
        "cpp"
      },
    },
  },
  {
  "neovim/nvim-lspconfig",
   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = false,
    config = function ()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = '1',
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'float',
    }
    end
  },
  {
    'mfussenegger/nvim-dap',
  },
    {
    'mfussenegger/nvim-dap-python',
    lazy = false,
    config = function ()
      require("dap-python").setup('./venv/Scripts/python.exe')
    end
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    opts = { floating = { border = "rounded" } },
    lazy = false,
    config = function (_, opts)
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
      dapui.setup(opts)
    end
  },
}

return plugins
