return {
  -- invert the word under cursor e.g no <-> yes true <-> false
  -- default key combo:  <leader>i
  'nguyenvukhang/nvim-toggler',
  config = function()
    require('nvim-toggler').setup {
      inverses = {
        ['black'] = 'white',
      },
    }
  end,
}
