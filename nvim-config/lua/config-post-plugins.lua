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

Map("n", "<C-n>", ":bnext<CR>", DefBufOpts, "Next Buffer")
Map("n", "<C-p>", ":bprev<CR>", DefBufOpts, "Previous Buffer")

-- Telescope
local builtin = require("telescope.builtin")
Map("n", "<leader>t", builtin.commands, DefBufOpts, "Telescope Buildin Cmds")
Map("n", "<leader>ff", builtin.find_files, DefBufOpts, "Telescope Find Files")
Map("n", "-", builtin.find_files, DefBufOpts, "Telescope Find Files")
Map("n", "<leader>fg", builtin.live_grep, DefBufOpts, "Telescope Live Grep")
Map("n", "<leader>fb", builtin.buffers, DefBufOpts, "Telescope Buffers")
Map("n", "<leader>fh", builtin.help_tags, DefBufOpts, "Telescope Help Tags")

Map("n", "[d", vim.diagnostic.goto_prev, DefBufOpts, "Next Diagnostic")
Map("n", "]d", vim.diagnostic.goto_next, DefBufOpts, "Previous Diagnostic")

Map("n", "<leader>dapo", function()
    require("dapui").open()
end, DefBufOpts, "Dap Open")

Map("n", "<leader>dapc", function()
    require("dapui").close()
end, DefBufOpts, "Dap Close")

Map("n", "<F5>", function()
    require("dap").continue()
end, DefBufOpts, "Dap Continue")

Map("n", "<F6>", function()
    require("dap").step_into()
end, DefBufOpts, "Dap Step Into")

Map("n", "<F7>", function()
    require("dap").step_out()
end, DefBufOpts, "Dap Step Out")

Map("n", "<F8>", function()
    require("dap").step_over()
end, DefBufOpts, "Dap Step Over")

Map("n", "<C-b>", function()
    require("dap").toggle_breakpoint()
end, DefBufOpts, "Dap Breakpoint")

Map("n", "<leader>dapb", function()
    require("dap").toggle_breakpoint()
end, DefBufOpts, "Dap Toggle Breakpoint")
