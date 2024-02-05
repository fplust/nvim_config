local map = require('core.utils').map

-- Quickfix
map('n', '<leader>ck', ':cexpr []<CR>', { noremap = true })
map('n', '<leader>cc', ':cclose <CR>', { noremap = true })
map('n', '<leader>co', ':copen <CR>', { noremap = true })
map('n', '<leader>cf', ':cfdo %s/', { noremap = true })
map('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', { noremap = true })
map('n', '<F1>', ':Git<CR>', { noremap = true })

require('core.mappings.telescope').init()
require('core.mappings.nvim-tree')
require('core.mappings.trouble')
require('core.mappings.terminal')
-- require('core.modules.lsp.mappings')
