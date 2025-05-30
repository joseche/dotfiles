return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
        require("ufo").setup()
        vim.o.foldcolumn = "1" -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities.textDocument.foldingRange = {
        -- 	dynamicRegistration = false,
        -- 	lineFoldingOnly = true,
        -- }
    end,
}
