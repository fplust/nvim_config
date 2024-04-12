return {
  { 'tpope/vim-repeat', lazy = false },

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
      require('plugins.modules.lualine')
    end,
  },

  -- file explorer
  {
    'kyazdani42/nvim-tree.lua',
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

  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {
      -- options
      notification = {
          override_vim_notify = true,
      }
    },
    -- init = function()
    --   vim.notify = require("fidget").notify
    -- end,
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
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.modules.autocomplete')
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs',
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        }
      },
    },
    event = {"InsertEnter"},
  },
  -- git commands
  {
    'tpope/vim-fugitive',
    cmd = {'Git', 'Gdiff', 'Gdiffsplit'},
  },

  -- git column signs
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufReadPost',
    opts = {
        on_attach = function(bufnr)
          local gs = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({']c', bang = true})
            else
              gs.nav_hunk('next')
            end
          end, {desc='next hunk'})

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({'[c', bang = true})
            else
              gs.nav_hunk('prev')
            end
          end, {desc='prev hunk'})

          -- Actions
          map({'n', 'v'}, '<leader>hs', gs.stage_hunk, {desc='stage hunk'})
          map({'n', 'v'}, '<leader>hr', gs.reset_hunk, {desc='reset hunk'})
          map('n', '<leader>hS', gs.stage_buffer, {desc='stage buffer'})
          map('n', '<leader>hR', gs.reset_buffer, {desc='reset buffer'})
          map('n', '<leader>hu', gs.undo_stage_hunk, {desc='undo stage_hunk'})
          map('n', '<leader>hp', gs.preview_hunk, {desc='preview hunk'})
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc='blame line'})
          map('n', '<leader>tb', gs.toggle_current_line_blame, {desc='toggle current line blame'})
          map('n', '<leader>hd', gs.diffthis, {desc='diff this'})
          -- map('n', '<leader>hD', function() gs.diffthis('~') end)
          -- map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
  },

  -- terminal
  -- {
  --   "akinsho/toggleterm.nvim",
  --   version = '*',
  --   cmd = {'ToggleTerm', 'TermSelect'},
  --   config = function()
  --     require('plugins.modules.terminal')
  --   end
  -- },

  -- file navigation
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    config = function()
      require('plugins.modules.telescope')
    end,
    cmd={'Telescope'},
  },
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy",
    opts = {},
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

  -- comments and stuff
  {
    'numToStr/Comment.nvim',
    config = true,
    event = 'BufReadPost',
    opts = {
      opleader = {
        line = 'grc',
        block = 'grb',
      }
    }
  },

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
  {
    'stevearc/overseer.nvim',
    cmd = {'OverseerRun', 'OverseerToggle'},
    opts = {
    },
  },
}
