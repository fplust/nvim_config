local map = require('core.utils').map

map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
map('n', '<leader>xd', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true, noremap = true })
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true, noremap = true })
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { silent = true, noremap = true })
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { silent = true, noremap = true })

