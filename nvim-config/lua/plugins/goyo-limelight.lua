local map = require("utils").map
return {
    {
        "junegunn/goyo.vim",
        config = function ()
            map('n', '<Leader>g', '<Cmd>Goyo<CR>', DefBufOpts, 'Goyo Toggle')
            vim.cmd [[
                autocmd! User GoyoEnter Limelight
                autocmd! User GoyoLeave Limelight!
                " Default: 0.5
                let g:limelight_default_coefficient = 0.7

                " Number of preceding/following paragraphs to include (default: 0)
                let g:limelight_paragraph_span = 1
            ]]
        end
    },
    {
        "junegunn/limelight.vim",
        -- config = function ()
        -- end
    }
}
