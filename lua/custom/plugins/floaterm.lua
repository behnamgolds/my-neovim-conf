return {
    'voldikss/vim-floaterm',
    config = function()
        -- vim.g.floaterm_height = 0.4
        -- vim.g.floaterm_wintype = 'split'

        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_title = 'Terminal'
        vim.g.floaterm_titleposition = 'center'
        vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
        vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
    end
}