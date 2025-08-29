local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local config = {
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
      vim.cmd.colorscheme 'everforest'
    end,
  },

  { 'tpope/vim-repeat', event = "VeryLazy" },

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
    lazy = false,
    config = function()
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("ts_ls")
    end,
  },

  -- autocompletion
  {
    'saghen/blink.cmp',
    event = "InsertEnter",
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
    'nvim-mini/mini.diff',
    version = '*',
    event = "VeryLazy",
    config = function()
      require('mini.diff').setup()
    end
  },
  {
    'nvim-mini/mini.pairs',
    version = '*',
    event = "VeryLazy",
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    'nvim-mini/mini.sessions',
    version = '*',
    lazy = false,
    config = function()
      require('mini.sessions').setup({
        autoread = false,
        file = '.vimsession'
      })
    end
  },
  {
    'nvim-mini/mini.starter',
    version = '*',
    event = "VimEnter",
    config = function()
      require('mini.starter').setup()
    end
  },

  -- file navigation
  {
    "ibhagwan/fzf-lua",
    cmd={'FzfLua'},
    opts={
        winopts = {
            preview = {
                hidden = true,
            }
        },
        git = {
            branches = {
                cmd = "git branch --sort=-committerdate --color"
            }
        }
    }
  },
  -- lang/syntax stuff
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    lazy = vim.fn.argc(-1) == 0,
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup {
        -- ensure_installed = {
        --   'c',
        --   'python',
        -- },
        highlight = {
          enable = true
        },
      }
    end,
  },

  -- surround
  {
    "kylechui/nvim-surround",
    config = true,
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal_cur = "yls",
        normal_cur_line = "ylS",
      }
    }
  },

  {
    'mbbill/undotree',
    cmd = {'UndotreeToggle'},
  },
}

require("lazy").setup(config, {
  defaults = { lazy = true },
  rocks = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'gzip',
        'zip',
        'zipPlugin',
        'tar',
        'tarPlugin',
        'getscript',
        'getscriptPlugin',
        'vimball',
        'vimballPlugin',
        '2html_plugin',
        'logipat',
        'rrhelper',
        'spellfile_plugin',
        'matchit',
        'editorconfig',
      },
    },
  },
})
