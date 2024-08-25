Map = require("utils").map

vim.cmd.colorscheme("catppuccin")

-- vim.api.nvim_create_user_command("Format", function(_)
--     vim.lsp.buf.format()
-- end, {})

-- move easily pressing option/alt
Map("n", "<M-Left>", ":wincmd h<CR>", DefBufOpts, "Go to Left window")
Map("n", "<M-Right>", ":wincmd l<CR>", DefBufOpts, "Go to Right window")
Map("n", "<M-Up>", ":wincmd k<CR>", DefBufOpts, "Go to Up window")
Map("n", "<M-Down>", ":wincmd j<CR>", DefBufOpts, "Go Down window")

Map("n", "<Leader>w", ":w<CR>", DefBufOpts, "Save current file")
Map("n", "<Leader>q", ":q<CR>", DefBufOpts, "Quit")


Map("n", "<Leader>g", ":Goyo<CR>", DefBufOpts, "Goyo Toggle")

Map("n", "<Leader>e", ":Neotree toggle<CR>", DefBufOpts, "Open Explorer")

Map("n", "<leader>o", ":Outline<CR>", DefBufOpts, "Toggle Outline")

-- Telescope
local builtin = require("telescope.builtin")
Map("n", "<leader>t", builtin.commands, DefBufOpts, "Telescope Buildin Cmds")
Map("n", "<leader>ff", builtin.find_files, DefBufOpts, "Telescope Find Files")
Map("n", "-", builtin.find_files, DefBufOpts, "Telescope Find Files")
Map("n", "<leader>fg", builtin.live_grep, DefBufOpts, "Telescope Live Grep")
Map("n", "<leader>fb", builtin.buffers, DefBufOpts, "Telescope Buffers")
Map("n", "<leader>fh", builtin.help_tags, DefBufOpts, "Telescope Help Tags")
