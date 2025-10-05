return {
    "pasky/claude.vim",
    config = function()
        local anthropic_key = vim.fn.getenv("ANTHROPIC_KEY")
        vim.g.claude_api_key = anthropic_key
        -- vim.api.nvim_set_keymap('n', '<Leader>j', ':AnyJump<CR>', {noremap = true})
        vim.g.claude_map_implement = "<Leader>ci"
        vim.g.claude_map_open_chat = "<Leader>cc"

    end,
}
