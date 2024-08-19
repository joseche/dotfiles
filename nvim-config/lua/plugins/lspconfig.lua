return {
    "neovim/nvim-lspconfig",
    dependencies = { "towolf/vim-helm" },
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.yamlls.setup({
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

        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}
