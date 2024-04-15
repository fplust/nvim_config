local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local indent = 4

local executable = function(e)
  return vim.fn.executable(e) > 0
end

-- cmd([[
-- 	filetype plugin indent on
-- 	autocmd BufWritePre * :%s/\s\+$//e
-- ]])
cmd([[
    autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
]])

g.mapleader = ' '
g.everforest_background = 'hard'
g.everforest_sign_column_background = 'none'
g.everforest_enable_italic = 1
g.editorconfig = false

-- misc
opt.syntax = 'enable'
opt.bg = 'dark'
opt.hidden = true
opt.encoding = 'utf-8'
opt.fileencodings = 'utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5,sjis,default'
opt.clipboard = 'unnamedplus'
opt.backspace = { 'eol', 'start', 'indent' }
opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
opt.showcmd = false
opt.foldmethod = "indent"
opt.foldlevel = 99
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- indention
opt.autoindent = true
-- opt.smartindent = true

-- tabs
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.expandtab = true

-- search
opt.wildmenu = true
opt.ignorecase = true
opt.smartcase = true
opt.wildignore = opt.wildignore + { '*/node_modules/*', '*/wp-includes/*', '*/wp-admin/*', '*/vendor/*' }
opt.hlsearch = false
if executable('rg') then
  opt.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
  opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
elseif executable('ag') then
  opt.grepprg = [[ag --nogroup --nocolor --vimgrep]]
  opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end

-- ui
opt.number = true
opt.rnu = false
-- opt.cursorline = true
opt.signcolumn = 'yes'
opt.laststatus = 3
opt.wrap = false
opt.scrolloff = 18
opt.sidescrolloff = 3 -- Lines to scroll horizontally
opt.list = true
opt.listchars = {
  tab = '❘-',
  trail = '·',
  lead = '·',
  extends = '»',
  precedes = '«',
  nbsp = '×',
}
opt.showmode = false
opt.lazyredraw = true
opt.mouse = 'a'
opt.splitright = true -- Open new split to the right
opt.splitbelow = true -- Open new split below

-- backups
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- autocomplete
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.shortmess = opt.shortmess + { c = true }

-- perfomance
opt.updatetime = 100
opt.timeoutlen = 500
opt.redrawtime = 1500
opt.ttimeoutlen = 50

-- theme
opt.termguicolors = true

-- diagnostic
vim.diagnostic.config({
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    header = false,
    source = 'always',
    border = 'single',
  },
  virtual_text = false,
  -- virtual_text = {
  --   spacing = 4,
  --   source = 'always',
  --   severity = {
  --     min = vim.diagnostic.severity.HINT,
  --   },
  -- },
})

-- gui
opt.guifont= "Iosevka Term Medium:h12"

-- session
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.api.nvim_create_user_command('Q', 'mksession! Session.vim | qa', {})
if vim.fn.findfile("Session.vim") ~= '' then
    cmd("source Session.vim")
end
