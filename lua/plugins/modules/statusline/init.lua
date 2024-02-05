local icons = require('core.theme.icons')
-- local lsp_status = require('lsp-status')
--
-- lsp_status.config({
--   indicator_errors = 'E',
--   indicator_warnings = 'W',
--   indicator_info = 'i',
--   indicator_hint = '?',
--   indicator_ok = 'Ok',
-- })
--
-- lsp_status.register_progress()
-- local function lsp()
--     return require('lsp-status').status()
-- end


require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'everforest',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
