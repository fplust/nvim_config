local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local indent = 4

-- cmd([[
-- 	filetype plugin indent on
-- 	autocmd BufWritePre * :%s/\s\+$//e
-- ]])
cmd([[
    autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
]])

g.mapleader = ' '
-- g.everforest_sign_column_background = 'none'
-- g.everforest_enable_italic = 1
g.editorconfig = false
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- misc
opt.syntax = 'enable'
opt.bg = 'dark'
-- opt.bg = 'light'
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
opt.undofile = true

-- indention
opt.autoindent = true
opt.smartindent = true

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

local executable = function(e)
  return vim.fn.executable(e) > 0
end
if executable('rg') then
  opt.grepprg = [[rg --vimgrep]]
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
-- opt.splitright = true -- Open new split to the right
-- opt.splitbelow = true -- Open new split below

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
    focusable = false,
    header = false,
    source = 'always',
    border = 'single',
    scope = 'cursor',
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

-- cursor hover show diagnostic
-- vim.api.nvim_create_autocmd("CursorHold", {
--   buffer = bufnr,
--   callback = function()
--     vim.diagnostic.open_float()
--   end
-- })

-- gui
opt.guifont= "Iosevka Term Medium:h12"

-- session
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.api.nvim_create_user_command('Q', 'mksession! .vimsession | qa', {})

-- mapping
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Quickfix
map('n', '<leader>ck', ':cex []<CR>', { desc="empty quickfix" })
map('n', '<leader>co', ':botright copen <CR>', { desc="open quickfix"})
map('n', '<leader>cc', ':cclose <CR>', { desc="close quickfix" })
-- map('n', '<leader>cf', ':cfdo %s/')
-- map('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', { desc="close buffer" })
map('n', '<F1>', ':Git<CR>')

map('n', '<leader>u', ':UndotreeToggle<CR>')

-- terminal
-- map('n', '<leader>t', ':tabnew +term<CR>')
-- map('n', '<C-`>', ':terminal<CR>')
map('t', '<Esc>', [[<C-\><C-n>]])

map('t', '<A-h>', [[<C-\><C-N><C-w>h]])
map('t', '<A-j>', [[<C-\><C-N><C-w>j]])
map('t', '<A-k>', [[<C-\><C-N><C-w>k]])
map('t', '<A-l>', [[<C-\><C-N><C-w>l]])
map('i', '<A-h>', [[<C-\><C-N><C-w>h]])
map('i', '<A-j>', [[<C-\><C-N><C-w>j]])
map('i', '<A-k>', [[<C-\><C-N><C-w>k]])
map('i', '<A-l>', [[<C-\><C-N><C-w>l]])
map('n', '<A-h>', [[<C-w>h]])
map('n', '<A-j>', [[<C-w>j]])
map('n', '<A-k>', [[<C-w>k]])
map('n', '<A-l>', [[<C-w>l]])
-- map('n', '<leader>t', ':TermSelect<CR>')
-- map('t', '<C-w>l', [[<C-\><C-n>:FloatermNext<CR>]])
-- map('t', '<C-w>h', [[<C-\><C-n>:FloatermPrev<CR>]])
-- map('t', '<C-w>n', [[<C-\><C-n>:FloatermNew<CR>]])
-- map('t', '<C-w>c', [[<C-\><C-n>:FloatermKill<CR>]])

-- fzf-lua
map('n', '<leader>f', ':FzfLua files<CR>')
map('n', '<leader>b', ':FzfLua buffers<CR>')
map('n', '<leader>t', ':FzfLua tabs<CR>')
map('n', '<leader>s', ':FzfLua live_grep<CR>')
map('n', '<leader>gc', ':FzfLua git_commits<CR>')
map('n', '<leader>gs', ':FzfLua git_status<CR>')
map('n', '<leader>gf', ':FzfLua git_files<CR>')
map('n', '<leader>gb', ':FzfLua git_branches<CR>')
map('n', '<leader>q', ':FzfLua quickfix<CR>')
map('n', '<leader>l', ':FzfLua loclist<CR>')
-- map('n', '<leader>t', ':Telescope tags<CR>')
map('n', '<leader>gd', ':FzfLua lsp_definitions<CR>')
map('n', '<leader>gr', ':FzfLua lsp_references<CR>')
map('n', '<leader>gi', ':FzfLua lsp_implementations<CR>')
map('n', '<leader>D', ':FzfLua lsp_typedefs<CR>')
map('n', '<leader>sd', ':FzfLua lsp_document_symbols<CR>')
map('n', '<leader>sw', ':FzfLua lsp_live_workspace_symbols<CR>')
map('n', '<leader>d', ':FzfLua diagnostics_document<CR>')

-- nvim-tree
map('n', '<leader>n', ':NvimTreeToggle<CR>')
map('n', '<leader>r', ':NvimTreeRefresh<CR>')


-- plugins
require("plugins")
require("im-select").setup()

-- load .vimsession
if vim.fn.argc() == 0 and vim.fn.findfile(".vimsession") ~= '' then
    vim.cmd("source .vimsession")
end

