return {
  { 'tpope/vim-repeat', lazy = false },

  -- color scheme
  -- {
  --   'maxmx03/solarized.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'solarized'
  --   end,
  -- },
  { 
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme everforest')
    end,
  },

  { -- statusline
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    config = function()
      require('plugins.modules.lualine')
    end,
  },

  -- file explorer
  {
    'kyazdani42/nvim-tree.lua',
    -- dependencies = {
    --   { 'kyazdani42/nvim-web-devicons' }
    -- },
    config = function()
      require('plugins.modules.nvim-tree').init()
    end,
    cmd = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
  },

  -- lsp
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require('plugins.modules.lsp')
    end,
  },

  -- autocompletion
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
  
    -- use a release tag to download pre-built binaries
    version = '1.*',
  
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'super-tab' },
  
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },
  
      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },
  
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
  
      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  -- git commands
  {
    'tpope/vim-fugitive',
    cmd = {'G', 'Git', 'Gdiff', 'Gdiffsplit'},
  },

  -- git column signs
  {
    'echasnovski/mini.diff',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('mini.diff').setup()
    end
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('mini.pairs').setup()
    end
  },

  -- terminal
  -- {
  --   "akinsho/toggleterm.nvim",
  --   version = '*',
  --   cmd = {'ToggleTerm', 'TermSelect'},
  --   config = function()
  --     require('toggleterm').setup()
  --   end
  -- },

  -- file navigation
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     {
  --       'nvim-telescope/telescope-fzf-native.nvim',
  --       build = 'make',
  --     },
  --   },
  --   config = function()
  --     require('plugins.modules.telescope')
  --   end,
  --   cmd={'Telescope'},
  -- },
  {
    "ibhagwan/fzf-lua",
    cmd={'FzfLua'},
  },
  -- {
  --   "folke/trouble.nvim",
  --   config = function()
  --     require("plugins.modules.trouble")
  --   end;
  --   event = 'BufReadPost',
  -- },

  -- session management
  -- use({
  --   'rmagatti/auto-session',
  --   event = 'VimEnter',
  --   config = function()
  --     require('auto-session').setup {
  --       auto_session_use_git_branch = true,
  --       -- postrestore_cmds = {'silent !kill -s SIGWINCH $PPID'}
  --     }
  --   end,
  -- })

  -- lang/syntax stuff
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   -- requires = {
  --   --   'nvim-treesitter/nvim-treesitter-refactor',
  --   -- },
  --   build = ':TSUpdate',
  --   config = function()
  --     require('plugins.modules.treesitter')
  --   end,
  -- },

  -- surround
  {
    "kylechui/nvim-surround",
    config = true,
    event = 'BufReadPost',
    opts = {
      keymaps = {
        normal_cur = "yls",
        normal_cur_line = "ylS",
      }
    }
  },

  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --   }
  -- },
  -- {
  --   'stevearc/overseer.nvim',
  --   cmd = {'OverseerRun', 'OverseerToggle'},
  --   opts = {
  --   },
  -- },
  {
    'mbbill/undotree',
    cmd = {'UndotreeToggle'},
  },
}
