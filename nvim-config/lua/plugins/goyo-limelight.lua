return {
    {
        "junegunn/goyo.vim",
        config = function ()
            vim.cmd [[
                autocmd! User GoyoEnter Limelight
                autocmd! User GoyoLeave Limelight!

                let g:goyo_width = '80%'

                " Default: 0.5
                let g:limelight_default_coefficient = 0.7

                " Number of preceding/following paragraphs to include (default: 0)
                let g:limelight_paragraph_span = 0
            ]]
        end
    },
    {
        "junegunn/limelight.vim",
        -- config = function ()
        -- end
    }
}
