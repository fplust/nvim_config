local icons = require('core.theme.icons')

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'everforest',
    -- component_separators = { left = icons.arrow_right, right = icons.arrow_left},
    -- section_separators = { left = icons.arrow_right_filled, right = icons.arrow_left_filled},
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', {
        'diagnostics',
        sources={'nvim_diagnostic', 'coc'},
        symbols = {error = icons.error, warn = icons.warn, info = icons.info, hint = icons.hint}
      }},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'bo:fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'quickfix', 'nvim-tree', 'fugitive'}
})
