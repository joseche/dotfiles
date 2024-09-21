return {
    "pechorin/any-jump.vim",
    config = function()
        vim.api.nvim_set_keymap('n', '<Leader>j', ':AnyJump<CR>', {noremap = true})
    end,
}
