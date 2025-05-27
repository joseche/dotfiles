local M = {}

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
})


Map = require("utils").map

function M.normal_mappings()
	-- Window movements
	Map("n", "<M-Left>", ":wincmd h<CR>", DefBufOpts, "Go to Left window")
	Map("n", "<M-Right>", ":wincmd l<CR>", DefBufOpts, "Go to Right window")
	Map("n", "<M-Up>", ":wincmd k<CR>", DefBufOpts, "Go to Up window")
	Map("n", "<M-Down>", ":wincmd j<CR>", DefBufOpts, "Go Down window")

	-- save and quit
	Map("n", "<Leader>w", ":w<CR>", DefBufOpts, "Save current file")
	Map("n", "<Leader>q", ":q<CR>", DefBufOpts, "Quit")

	-- Goyo, zen mode
	Map("n", "<Leader>g", ":Goyo<CR>", DefBufOpts, "Goyo Toggle")

	-- explorer
	Map("n", "<Leader>e", ":Neotree toggle<CR>", DefBufOpts, "Open Explorer")

	-- outline
	Map("n", "<Leader>o", ":Outline<CR>", DefBufOpts, "Toggle Outline")

	-- moving buffers
	Map("n", "<C-n>", ":bnext<CR>", DefBufOpts, "Next Buffer")
	Map("n", "<C-p>", ":bprev<CR>", DefBufOpts, "Previous Buffer")
	Map("n", "<C-l>", ":buffers<CR>", DefBufOpts, "Buffers")

	-- Telescope
	local builtin = require("telescope.builtin")
	Map("n", "<Leader>t", builtin.commands, DefBufOpts, "Telescope Buildin Cmds")
	Map("n", "<Leader>ff", builtin.find_files, DefBufOpts, "Telescope Find Files")
	Map("n", "-", builtin.find_files, DefBufOpts, "Telescope Find Files")
	Map("n", "<Leader>fg", builtin.live_grep, DefBufOpts, "Telescope Live Grep")
	Map("n", "<Leader>fb", builtin.buffers, DefBufOpts, "Telescope Buffers")
	Map("n", "<Leader>fh", builtin.help_tags, DefBufOpts, "Telescope Help Tags")

	-- diagnostics
	Map("n", "[d", vim.diagnostic.goto_prev, DefBufOpts, "Next Diagnostic")
	Map("n", "]d", vim.diagnostic.goto_next, DefBufOpts, "Previous Diagnostic")

	Map("n", "<Leader>dapo", function()
		require("dapui").open()
	end, DefBufOpts, "Dap Open")
	Map("n", "<Leader>dapc", function()
		require("dapui").close()
	end, DefBufOpts, "Dap Close")
	Map("n", "<Leader>dapb", function()
		require("dap").toggle_breakpoint()
	end, DefBufOpts, "Dap Toggle Breakpoint")
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
	Map("n", "<Leader>s", function()
		require("dap").step_over()
	end, DefBufOpts, "Dap Step Over")
	Map("n", "<C-b>", function()
		require("dap").toggle_breakpoint()
	end, DefBufOpts, "Dap Breakpoint")
end

function M.dapMappings()
	vim.notify("DAP Mappings")
end

return M
