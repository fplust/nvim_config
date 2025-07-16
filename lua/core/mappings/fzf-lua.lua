local map = require('core.utils').map
local M = {}

function M.init()
  map('n', '<leader>f', ':FzfLua files<CR>', { noremap = true })
  map('n', '<leader>b', ':FzfLua buffers<CR>', { noremap = true })
  map('n', '<leader>s', ':FzfLua live_grep<CR>', { noremap = true })
  map('n', '<leader>gc', ':FzfLua git_commits<CR>', { noremap = true })
  map('n', '<leader>gs', ':FzfLua git_status<CR>', { noremap = true })
  map('n', '<leader>gf', ':FzfLua git_files<CR>', { noremap = true })
  map('n', '<leader>gb', ':FzfLua git_branches<CR>', { noremap = true })
  map('n', '<leader>q', ':FzfLua quickfix<CR>', { noremap = true })
  map('n', '<leader>l', ':FzfLua loclist<CR>', { noremap = true })
  -- map('n', '<leader>t', ':Telescope tags<CR>', { noremap = true })
  map('n', 'gd', ':FzfLua lsp_definitions<CR>', { noremap = true })
  map('n', 'gr', ':FzfLua lsp_references<CR>', { noremap = true })
  map('n', 'gi', ':FzfLua lsp_implementations<CR>', { noremap = true })
  map('n', '<leader>D', ':FzfLua lsp_typedefs<CR>', { noremap = true })
  map('n', '<leader>sd', ':FzfLua lsp_document_symbols<CR>', { noremap = true })
  map('n', '<leader>sw', ':FzfLua lsp_live_workspace_symbols<CR>', { noremap = true })
  map('n', '<leader>d', ':FzfLua diagnostics_document<CR>', { noremap = true })
end

return M

