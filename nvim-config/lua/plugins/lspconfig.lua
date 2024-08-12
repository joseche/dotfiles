local remap = require("utils").remap

local on_attach = function(_, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    remap("n", "gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
    remap("n", "gd", vim.lsp.buf.definition, bufopts, "Go to definition")
    remap("n", "gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
    remap("n", "K", vim.lsp.buf.hover, bufopts, "Hover text")
    remap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")
    remap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
    remap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
    remap("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts, "List workspace folders")
    remap("n", "<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
    remap("n", "<space>rn", vim.lsp.buf.rename, bufopts, "Rename")
    remap("n", "<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
    vim.keymap.set(
        "v",
        "<space>ca",
        "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
    )
    remap("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts, "Format file")
end

return {
    "neovim/nvim-lspconfig",
    dependencies = { "towolf/vim-helm" },
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
            on_attach = on_attach,
            capabilities = capabilities,
        })
        lspconfig.pylsp.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
        lspconfig.bashls.setup({
            on_attach = on_attach,
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

        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}
