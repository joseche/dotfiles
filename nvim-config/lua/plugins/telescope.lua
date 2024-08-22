local map = require("utils").map

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

        local builtin = require("telescope.builtin")
        map("n", "<leader>t", builtin.commands, DefBufOpts, "Telescope Buildin Cmds")
        map("n", "<leader>ff", builtin.find_files, DefBufOpts, "Telescope Find Files")
        map("n", "<leader>fg", builtin.live_grep, DefBufOpts, "Telescope Live Grep")
        map("n", "<leader>fb", builtin.buffers, DefBufOpts, "Telescope Buffers")
        map("n", "<leader>fh", builtin.help_tags, DefBufOpts, "Telescope Help Tags")
    end,
}
