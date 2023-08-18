local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd="Copilot",
    event="VimEnter",
    config=function ()
      require("copilot").setup({
      suggestion = {
        enable = true,
        auto_trigger = true,
        keymap={
        accept="<C-q>",
        accept_word="<C-Right>",
        accept_line="<C-Down>",
        }
    -- accept_word="<>", 
        },
        panel = {
        enable = true,
        },
        copilot_node_command=vim.fn.expand("$HOME") .. "/.nvm/versions/node/v16.3.0/bin/node",

     })
    end,
    -- opts = overrides.copilot,
    -- echo hello
    -- 
    --mapping 
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "windwp/nvim-autopairs",
        -- opts = {
        --   fast_wrap = {},
        --   disable_filetype = { "TelescopePrompt", "vim" },
        -- },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
          local aps=require("nvim-autopairs")
          local Rule=require("nvim-autopairs.rule")
          aps.add_rules({
            Rule("<",">","lua"),})
          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

    },
    opts = overrides.cmp
  },
  {
    "dstein64/nvim-scrollview",
    event="VimEnter",
    config = function()
      require("scrollview").setup({
        excluded_filetypes = {"NvimTree","help", "terminal", "dashboard"},
        current_only = true,
        signs_on_startup = {'conflicts','search',},
        winblend = 30,

      })
    end,
    },
    
  --   {
  --     "windwp/nvim-autopairs",
  --      config=function()
  --         local aps=require("nvim-autopairs")
  --         local Rule=require("nvim-autopairs.rule")
  --         aps.add_rules({
  --           Rule("<",">","lua"),})
  --         end,
  -- }
  -- {
  --   "Xuyuanp/scrollbar.nvim",
  --   config = function()
  --     require("scrollbar").setup()
  --   end,
  --   lazy = false,
  --
  --   }
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },


  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
