local map = require("utils").map

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = function()
        require("neo-tree").setup({
            enable_diagnostics = true,
            enable_git_status = true,
            window = {
                mappings = {
                    ["ga"] = "git_add_file",
                    ["gr"] = "git_revert_file",
                    ["gc"] = "git_commit",
                    ["gp"] = "git_push",
                    ["gg"] = "git_commit_and_push",
                    ["<esc>"] = "cancel", -- close preview or floating neo-tree window
                    ["P"] = "toggle_preview",
                }
            }
        })
        -- keymaps
        map('n', '<Leader>e', ':Neotree reveal left<CR>', DefBufOpts, "Open Explorer")
        map('n', '<Leader>c', ':Neotree close<CR>', DefBufOpts, 'Close Explorer')
    end
}
