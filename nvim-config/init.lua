-- Some basic options
vim.opt.number = true -- Enable line numbers
-- vim.opt.relativenumber = true
vim.opt.tabstop = 4 -- Number of spaces a tab represents
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Automatically indent new lines
-- vim.opt.cursorline = true -- Highlight the current line
vim.opt.termguicolors = true -- Enable 24-bit RGB colors

vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 4
vim.opt.foldlevelstart = 4
vim.opt.conceallevel = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.virtualedit = "block"

vim.o.clipboard = 'unnamedplus'

-- Syntax highlighting and filetype plugins
vim.opt.syntax = 'on'
vim.cmd("filetype plugin indent on")

-- move easily pressing option/alt
vim.api.nvim_set_keymap("n", "<M-Left>", ":wincmd h<CR>",  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Right>", ":wincmd l<CR>",  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Up>", ":wincmd k<CR>",  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Down>", ":wincmd d<CR>",  { noremap = true, silent = true })

-- vim.cmd.colorscheme('torte')

-- Leader key
vim.g.mapleader = " " -- Space as the leader key
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true })

require("lazy-configuration")
