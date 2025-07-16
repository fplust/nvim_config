local g = vim.g
local icons = require('core.theme.icons')
local M = {}

function M.init()
  -- settings
  g.nvim_tree_refresh_wait = 300
  g.loaded_netrw = 1
  g.loaded_netrwPlugin = 1

  -- set up args
  local args = {
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          git = false,
          folder = false,
          file = false,
          folder_arrow = true,
        },
        glyphs = {
          default = '',
          symlink = icons.symlink,
          git = icons.git,
          folder = icons.folder,
        }
      },
      highlight_git = true,
      highlight_opened_files = 'name'
    },
    diagnostics = {
      enable = false,
    },
    update_focused_file = {
      enable = true,
      ignore_list = {},
    },
    filters = {
      custom = { '.git', 'node_modules', '.cache', '__pycache__' }
    }
  }

  require('nvim-tree').setup(args)
end

return M
