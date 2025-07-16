local actions = require('telescope.actions')
local mappings = require('core.mappings.telescope').mappings()
local icons = require('core.theme.icons')

local opts_cursor = {
  initial_mode = 'normal',
  sorting_strategy = 'ascending',
  layout_strategy = 'cursor',
  results_title = false,
  layout_config = {
    width = 0.5,
    height = 0.4,
  },
}

local opts_vertical = {
  initial_mode = 'normal',
  sorting_strategy = 'ascending',
  layout_strategy = 'vertical',
  results_title = false,
  layout_config = {
    width = 0.6,
    height = 0.5,
    prompt_position = 'top',
    mirror = true,
  },
}

local file_picker = function()
  local state = require("telescope.actions.state")
  local builtin = require("telescope.builtin")
  return builtin.find_files({ ["default_text"] = state.get_current_line() })
end

require('telescope').setup({
  defaults = {
    prompt_prefix = '> ',
    selection_caret = icons.folder.arrow_closed,
    file_ignore_patterns = {
      '.git/',
    },
    dynamic_preview_title = true,
    vimgrep_arguments = {
      'rg',
      '--ignore',
      '--hidden',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    preview = {
      hide_on_startup = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
  pickers = {
    buffers = {
      prompt_title = '✨ Search Buffers ✨',
      mappings = vim.tbl_deep_extend('force', {
        n = {
          ['d'] = actions.delete_buffer,
        },
        i = {
          ["<C-f>"] = file_picker,
        }
      }, mappings),
      sort_mru = true,
      preview_title = false,
    },
    diagnostics = vim.tbl_deep_extend('force', opts_vertical, {
      prompt_title = 'Diagnostics',
      mappings = mappings,
      bufnr = 0,
    }),
    lsp_implementations = vim.tbl_deep_extend('force', opts_cursor, {
      prompt_title = 'Implementations',
      mappings = mappings,
    }),
    lsp_definitions = vim.tbl_deep_extend('force', opts_cursor, {
      prompt_title = 'Definitions',
      mappings = mappings,
    }),
    lsp_references = vim.tbl_deep_extend('force', opts_cursor, {
      prompt_title = 'References',
      mappings = mappings,
    }),
    find_files = {
      prompt_title = '✨ Search Project ✨',
      mappings = mappings,
      hidden = true,
    },
    git_files = {
      prompt_title = '✨ Search Git Project ✨',
      mappings = mappings,
      hidden = true,
    },
    live_grep = {
      prompt_title = '✨ Live Grep ✨',
      mappings = mappings,
    },
    git_branches = {
      mappings = {
        i = { ["<cr>"] = actions.git_switch_branch },
      },
    },
  },
})

require('telescope').load_extension('fzf')
