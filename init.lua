require("core")
require("plugins")

if vim.fn.argc() == 0 and vim.fn.findfile("Session.vim") ~= '' then
    vim.cmd("source Session.vim")
end
