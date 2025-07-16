local M = {}

local function get_basename(file)
  return file:match('^.+/(.+)$')
end

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.split(str, sep)
  local res = {}
  for w in str:gmatch('([^' .. sep .. ']*)') do
    if w ~= '' then
      table.insert(res, w)
    end
  end
  return res
end

function M.nmap(keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

function M.vmap(keys, func, desc)
  vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
end


function M.highlight(group, bg, fg, gui)
  if gui ~= nil and gui ~= '' then
    vim.api.nvim_command(string.format('hi %s guibg=%s guifg=%s gui=%s', group, bg, fg, gui))
  else
    vim.api.nvim_command(string.format('hi %s guibg=%s guifg=%s', group, bg, fg))
  end
end

return M
