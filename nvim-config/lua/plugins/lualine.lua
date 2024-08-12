return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                "codedark",
            },
            extensions = { "quickfix" },
            sections = {
                lualine_c = {
                    { "filename" },
                    {
                        function()
                            return ("%s"):format(require("schema-companion.context").get_buffer_schema(0).name)
                        end,
                        cond = function()
                            return package.loaded["schema-companion"]
                        end,
                    },
                },
            },
        })
    end,
}
