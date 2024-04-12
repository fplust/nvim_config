local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  local vmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>sd', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>sw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>d', require('telescope.builtin').diagnostics, "Diagnostics")

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- diagnostics
  nmap('[g', vim.diagnostic.goto_prev, '[D]iagnostic [P]revious')
  nmap(']g', vim.diagnostic.goto_next, '[D]iagnostic [Nlext')
  nmap('<leader>gf', vim.lsp.buf.format, '[F]ormatting')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- cursor hover show diagnostic
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end

local servers = {
  clangd = {},
  -- gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
}

capabilities = require('cmp_nvim_lsp').default_capabilities()

for k, v in pairs(servers) do
  lspconfig[k].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

-- efm config
-- lspconfig.efm.setup {
--     init_options = {documentFormatting = true},
--     filetypes = { 'javascript', 'python', 'typescript' },
--     settings = {
--       rootMarkers = {".git/"},
--       languages = {
--         python = {
--           {
--             prefix = "ruff",
--             formatCommand = "ruff format --no-cache --stdin-filename '${INPUT}'",
--             formatStdin = true,
--             lintSource = "efm ruff",
--             lintCommand = "ruff check --stdin-filename '${INPUT}'",
--             lintStdin = true,
--             lintFormats = { '%.%#:%l:%c: %t%n %m' },
--             lintSeverity = 4,
--             lintOnSave = true,
--           }
--         }
--       }
--     }
-- }
