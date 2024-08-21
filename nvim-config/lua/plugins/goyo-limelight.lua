local map = require("utils").map
return {
    {
        "junegunn/goyo.vim",
        config = function ()
            map('n', '<Leader>g', '<Cmd>Goyo<CR>', DefBufOpts, 'Goyo Toggle')
            vim.cmd [[
                autocmd! User GoyoEnter Limelight
                autocmd! User GoyoLeave Limelight!
            ]]
        end
    },
    {
        "junegunn/limelight.vim",
        -- config = function ()
        -- end
    }
}
