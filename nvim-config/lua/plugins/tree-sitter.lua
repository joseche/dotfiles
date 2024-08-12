return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup(
            {
                auto_install = true,
                autotag = { enable = true },
                ensure_installed = {
                    "bash",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                },
                highlight = { enable = true },
                indent = { enable = true },
            }
        )
    end
}
