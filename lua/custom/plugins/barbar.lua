local plugin = {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- patched fonts support
    'lewis6991/gitsigns.nvim', -- display git status
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    local barbar = require 'barbar'

    require('which-key').add {
      -- ['<leader>b'] = { name = '[B]ar Bar', _ = 'which_key_ignore' },
      { '<leader>b', group = '[B]ar Bar' },
      { '<leader>b_', hidden = true },
    }

    -- allow barbar tab order to be saved with :mksession
    vim.opt.sessionoptions:append 'globals'
    vim.api.nvim_create_user_command('Mksession', function(attr)
      vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })

      -- Neovim 0.8+
      vim.cmd.mksession { bang = attr.bang, args = attr.fargs }

      -- Neovim 0.7
      -- vim.api.nvim_command('mksession ' .. (attr.bang and '!' or '') .. attr.args)
    end, { bang = true, complete = 'file', desc = 'Save barbar with :mksession', nargs = '?' })
    -- allow barbar tab order to be saved with :mksession

    barbar.setup {
      clickable = true, -- Enables/disables clickable tabs
      tabpages = false, -- Enable/disables current/total tabpages indicator (top right corner)
      insert_at_end = true,
      icons = {
        button = '',
        buffer_index = true,
        filetype = { enabled = true },
        visible = { modified = { buffer_number = false } },
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
      },
    }

    -- key maps

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<leader>bb', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<leader>bn', '<Cmd>BufferNext<CR>', opts)
    -- Re-order to previous/next
    map('n', '<leader>bB', '<Cmd>BufferMovePrevious<CR>', opts)
    map('n', '<leader>bN', '<Cmd>BufferMoveNext<CR>', opts)
    -- Goto buffer in position...
    map('n', '<leader>b1', '<Cmd>BufferGoto 1<CR>', opts)
    map('n', '<leader>b2', '<Cmd>BufferGoto 2<CR>', opts)
    map('n', '<leader>b3', '<Cmd>BufferGoto 3<CR>', opts)
    map('n', '<leader>b4', '<Cmd>BufferGoto 4<CR>', opts)
    map('n', '<leader>b5', '<Cmd>BufferGoto 5<CR>', opts)
    map('n', '<leader>b6', '<Cmd>BufferGoto 6<CR>', opts)
    map('n', '<leader>b7', '<Cmd>BufferGoto 7<CR>', opts)
    map('n', '<leader>b8', '<Cmd>BufferGoto 8<CR>', opts)
    map('n', '<leader>b9', '<Cmd>BufferGoto 9<CR>', opts)
    map('n', '<leader>b0', '<Cmd>BufferLast<CR>', opts)
    -- Pin/unpin buffer
    -- map("n", "<C-p>", "<Cmd>BufferPin<CR>", opts)
    -- Close buffer
    map('n', '<leader>bx', '<Cmd>BufferClose<CR>', opts)
    map('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
  end,
}

return plugin
