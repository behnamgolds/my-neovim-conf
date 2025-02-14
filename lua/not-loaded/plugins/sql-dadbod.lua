return {
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-completion',
  'kristijanhusak/vim-dadbod-ui',

  -- Setup up vim-dadbod
  require('cmp').setup.filetype({ 'sql' }, {
    sources = {
      { name = 'vim-dadbod-completion' },
      { name = 'buffer' },
    },
  }),
}
