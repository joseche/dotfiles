return {
	"neovim/nvim-lspconfig",
    dependencies = { 'towolf/vim-helm' },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")
		lspconfig.jsonls.setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.jedi_language_server.setup({
			capabilities = capabilities,
		})
		lspconfig.pylsp.setup({
			capabilities = capabilities,
		})
		lspconfig.bashls.setup({
			capabilities = capabilities,
		})
		lspconfig.dockerls.setup({
			capabilities = capabilities,
		})
		lspconfig.yamlls.setup({
			capabilities = capabilities,
			settings = {
				yaml = {
					format = {
						enable = true,
					},
					validate = true,
					completion = true,
				},
			},
		})
		lspconfig.helm_ls.setup({
			settings = {
				["helm-ls"] = {
					yamlls = {
						path = "yaml-language-server",
					},
                    validate = true,
                    completion = true,
				},
			},
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
