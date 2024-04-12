local icons = require('core.theme.icons')

require('trouble').setup({
  icons = false,
  fold_open = "v", -- icon used for open folds
  fold_closed = ">", -- icon used for closed folds
  indent_lines = false, -- add an indent guide below the fold icons
  signs = {
      error = icons.error,
      warning = icons.warn,
      hint = icons.hint,
      information = icons.info
  },
  use_lsp_diagnostic_signs = false,
})
