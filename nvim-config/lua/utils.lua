local M = {}

function M.map(mode, rhs, lhs, bufopts, desc)
    if bufopts == nil then
        bufopts = {}
    end
    bufopts.desc = desc
    vim.keymap.set(mode, rhs, lhs, bufopts)
end

function M.on_attach_lsp(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    M.map("n", "gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
    M.map("n", "gd", vim.lsp.buf.definition, bufopts, "Go to definition")
    M.map("n", "gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
    M.map("n", "K", vim.lsp.buf.hover, bufopts, "Hover text")
    M.map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")
    M.map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
    M.map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
    M.map("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts, "List workspace folders")
    M.map("n", "<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
    M.map("n", "<space>r", vim.lsp.buf.rename, bufopts, "Rename")
    M.map("n", "<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
    M.map("n", "<leader>f", vim.lsp.buf.format, DefBufOpts, "Format File")
end

return M
