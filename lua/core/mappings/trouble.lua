local map = require('core.utils').map

map('n', '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true, noremap = true })

