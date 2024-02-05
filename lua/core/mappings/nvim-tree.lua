local map = require('core.utils').map

map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
map('n', '<C-r>', ':NvimTreeRefresh<CR>', { noremap = true })
