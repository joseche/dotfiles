

-- Some basic options
vim.o.number = true -- Enable line numbers
vim.o.tabstop = 4 -- Number of spaces a tab represents
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.smartindent = true -- Automatically indent new lines
-- vim.o.cursorline = true -- Highlight the current line
vim.o.termguicolors = true -- Enable 24-bit RGB colors

vim.o.foldenable = true
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 4
vim.o.foldlevelstart = 4
vim.o.conceallevel = 2

-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')


-- vim.cmd.colorscheme('torte')

-- Leader key
vim.g.mapleader = ' ' -- Space as the leader key
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })



require("lazy-configuration")

