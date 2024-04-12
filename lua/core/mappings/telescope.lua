local map = require('core.utils').map
local M = {}

function M.init()
  map('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true })
  map('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true })
  map('n', '<leader>s', ':Telescope live_grep<CR>', { noremap = true })
  map('n', '<leader>gc', ':Telescope git_commits<CR>', { noremap = true })
  map('n', '<leader>gs', ':Telescope git_status<CR>', { noremap = true })
  map('n', '<leader>gf', ':Telescope git_files<CR>', { noremap = true })
  map('n', '<leader>q', ':Telescope quickfix<CR>', { noremap = true })
  map('n', '<leader>j', ':Telescope jumplist<CR>', { noremap = true })
  map('n', '<leader>l', ':Telescope loclist<CR>', { noremap = true })
  map('n', '<leader>t', ':Telescope tags<CR>', { noremap = true })
end

function M.mappings()
  local actions = require('telescope.actions')
  local layout = require('telescope.actions.layout')
  local normal = {
    n = {
      ['Q'] = actions.smart_add_to_qflist + actions.open_qflist,
      ['q'] = actions.smart_send_to_qflist + actions.open_qflist,
      ['v'] = actions.file_vsplit,
      ['s'] = actions.file_split,
      ['p'] = layout.toggle_preview,
      -- ['<cr>'] = actions.file_edit,
    },
  }

  return normal
end

return M
