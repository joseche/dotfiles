vim.cmd.colorscheme("catppuccin")

vim.api.nvim_create_user_command("Format", function(_)
	vim.lsp.buf.format()
end, {})

