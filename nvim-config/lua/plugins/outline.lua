local map = require("utils").map

return {
    "hedyhli/outline.nvim",
    config = function()
        map("n", "<leader>o", "<cmd>Outline<CR>", DefBufOpts, "Toggle Outline")
        require("outline").setup({})
    end,
}
