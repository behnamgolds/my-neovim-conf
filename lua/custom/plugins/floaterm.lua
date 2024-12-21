return {
  'voldikss/vim-floaterm',
  config = function()
    -- vim.g.floaterm_height = 0.4
    -- vim.g.floaterm_wintype = 'split'

    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    -- vim.g.floaterm_autohide = 0
    -- vim.g.floaterm_title = 'Terminal $1/$2'
    vim.g.floaterm_title = ' Terminal '
    vim.g.floaterm_titleposition = 'center'
    vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>', { silent = true })
    vim.keymap.set('v', '<F1>', '<Esc>:FloatermToggle<CR>', { silent = true })
    vim.keymap.set('i', '<F1>', '<Esc>:FloatermToggle<CR>', { silent = true })

    vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true })

    -- vim.keymap.set('n', '<F2>', '<C-\\><C-n>:FloatermNew<CR>')
    -- vim.keymap.set('t', '<F2>', '<C-\\><C-n>:FloatermNew<CR>')
    --
    -- vim.keymap.set('n', '<F3>', '<C-\\><C-n>:FloatermNext<CR>')
    -- vim.keymap.set('t', '<F3>', '<C-\\><C-n>:FloatermNext<CR>')
    --
    -- vim.keymap.set('n', '<F4>', '<C-\\><C-n>:FloatermPrev<CR>')
    -- vim.keymap.set('t', '<F4>', '<C-\\><C-n>:FloatermPrev<CR>')
  end,
}
