require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'typescript',
    'javascript',
    'tsx',
    'html',
    'css',
    'bash',
    'lua',
    'json',
    'python',
    'go',
    'rust',
    'ocaml',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
    disable = { 'python' },
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
})
