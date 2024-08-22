-- Leader key
vim.g.mapleader = " " -- Space as the leader key
vim.g.maplocalleader = "\\"

-- o for options
local o = vim.opt

-- Some basic options
o.number = true        -- Enable line numbers
-- o.relativenumber = true
o.tabstop = 4          -- Number of spaces a tab represents
o.shiftwidth = 4       -- Number of spaces for each indentation
o.expandtab = true     -- Convert tabs to spaces
o.smartindent = true   -- Automatically indent new lines
-- o.cursorline = true -- Highlight the current line
o.termguicolors = true -- Enable 24-bit RGB colors

o.foldenable = true
o.foldmethod = "indent"
o.foldlevel = 4
o.foldlevelstart = 4
o.conceallevel = 2

o.splitbelow = true
o.splitright = true

o.virtualedit = "block"

o.spell = true
o.spelllang = { "en_us" }

o.hlsearch = true

-- o.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
o.listchars = {tab = '▸ ', trail = '·'}
o.list = true

o.clipboard = "unnamedplus"

-- Syntax highlighting and filetype plugins
o.syntax = "on"

vim.cmd("filetype plugin indent on")

local map = require("utils").map
DefBufOpts = { noremap = true, silent = true }

-- move easily pressing option/alt
map("n", "<M-Left>", ":wincmd h<CR>", DefBufOpts, "Go to Left window")
map("n", "<M-Right>", ":wincmd l<CR>", DefBufOpts, "Go to Right window")
map("n", "<M-Up>", ":wincmd k<CR>", DefBufOpts, "Go to Up window")
map("n", "<M-Down>", ":wincmd j<CR>", DefBufOpts, "Go Down window")

map("n", "<Leader>w", ":w<CR>", DefBufOpts, "Save current file")
map("n", "<Leader>q", ":q<CR>", DefBufOpts, "Quit")

