return {
  { 'tpope/vim-repeat' },

  --[[ use({ -- color scheme
    'ishan9299/nvim-solarized-lua',
    config = function()
      vim.cmd('colorscheme solarized-flat')
    end,
  }) ]]
  { -- color scheme
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
      require('plugins.modules.statusline')
    end,
  },

  -- file explorer
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins.modules.file-explorer').init()
    end,
    lazy = true,
    cmd = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
  },

  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
    init = function()
      vim.notify = require("fidget").notify
    end,
  },
  -- lsp
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- 'ray-x/lsp_signature.nvim',
    },
    config = function()
      require('plugins.modules.lsp')
    end,
  },

  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.modules.autocomplete')
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs',
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
      },
      "rafamadriz/friendly-snippets",
    },
    event = "InsertEnter",
  },
  -- git commands
  {
    'tpope/vim-fugitive',
    lazy = true,
    cmd = {'Git', 'Gdiff', 'Gdiffsplit'},
  },

  -- git column signs
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufRead',
    opts = {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          -- map('n', '<leader>hS', gs.stage_buffer)
          -- map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          -- map('n', '[h', gs.preview_hunk)
          -- map('n', ']h', gs.next_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          -- map('n', '<leader>hD', function() gs.diffthis('~') end)
          -- map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
  },

  -- terminal
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    lazy = true,
    cmd = {'ToggleTerm', 'TermSelect'},
    config = function()
      require('plugins.modules.terminal')
    end
  },

  -- file navigation
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    config = function()
      require('plugins.modules.navigation')
    end,
    cmd={'Telescope'},
    -- event = 'BufRead',
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("plugins.modules.trouble")
    end;
    event = 'BufRead',
  },

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

  -- comments and stuff
  {
    'numToStr/Comment.nvim',
    config = true,
    event = 'BufRead',
  },

  -- surround
  {
    "kylechui/nvim-surround",
    config = true,
    event = 'BufRead',
  },

  -- colorized hex codes
  --[[ use({
    'norcalli/nvim-colorizer.lua',
    opt = true,
    cmd = { 'ColorizerToggle' },
    config = function()
      require('colorizer').setup()
    end,
  }) ]]
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
}
