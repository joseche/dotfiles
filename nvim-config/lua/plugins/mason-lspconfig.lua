return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "jedi_language_server" },
            automatic_installation = true,
        })
    end
}
