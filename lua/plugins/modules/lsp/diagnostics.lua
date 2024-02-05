local config = require('plugins.modules.lsp.config')
local icons = require('core.theme.icons')

local defaults = {
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    header = false,
    source = 'always',
    border = 'single',
  },
  virtual_text = false,
  --[[ virtual_text = {
    spacing = 4,
    source = 'always',
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  }, ]]
}

local opts = defaults

vim.diagnostic.config(opts)

local function do_diagnostic_signs()
  local signs = {
    Error = icons.error .. ' ',
    Warn = icons.warn .. ' ',
    Hint = icons.hint .. ' ',
    Info = icons.info .. ' ',
  }

  local t = vim.fn.sign_getdefined('DiagnosticSignWarn')
  if vim.tbl_isempty(t) then
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end
  end
end

local function do_legacy_diagnostic_signs()
  local signs = {
    Error = icons.error .. ' ',
    Warning = icons.warn .. ' ',
    Hint = icons.hint .. ' ',
    Information = icons.info .. ' ',
  }
  local h = vim.fn.sign_getdefined('LspDiagnosticsSignWarn')
  if vim.tbl_isempty(h) then
    for type, icon in pairs(signs) do
      local hl = 'LspDiagnosticsSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end
  end
end

do_diagnostic_signs()
do_legacy_diagnostic_signs()
