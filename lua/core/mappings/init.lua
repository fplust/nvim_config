local map = require('core.utils').map

-- Quickfix
map('n', '<leader>ck', ':cex []<CR>', { noremap = true, desc="empty quickfix" })
map('n', '<leader>co', ':copen <CR>', { noremap = true, desc="open quickfix"})
map('n', '<leader>cc', ':cclose <CR>', { noremap = true, desc="close quickfix" })
-- map('n', '<leader>cf', ':cfdo %s/', { noremap = true })
-- map('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', { noremap = true, desc="close buffer" })
map('n', '<F1>', ':Git<CR>', { noremap = true })

map('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })

-- require('core.mappings.telescope').init()
require('core.mappings.fzf-lua').init()
require('core.mappings.nvim-tree')
require('core.mappings.terminal')
-- require('core.mappings.trouble')
