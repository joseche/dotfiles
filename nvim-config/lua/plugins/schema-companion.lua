return {
	"cenk1cenk2/schema-companion.nvim",
	name = "schema-companion",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
	config = function()
		require("schema-companion").setup({
			-- if you have telescope you can register the extension
			enable_telescope = true,
			formatting = true,
			matchers = {
				-- add your matchers
				require("schema-companion.matchers.kubernetes").setup({ version = "master" }),
			},
			schemas = {
				{
					name = "Kubernetes master",
					uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
				},
			},
		})
	end,
}
