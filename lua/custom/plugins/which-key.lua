local plugin = {
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        -- ['<leader>w'] = { name = '[W]orkspace{ "<leader>w", group = "[W]orkspace" },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
        -- ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>t_', hidden = true },
        -- ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
        { '<leader>h', group = 'Git [H]unk' },
        { '<leader>h_', hidden = true },
        { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
      }
      -- visual mode
      -- require('which-key').register({
      --   ['<leader>h'] = { 'Git [H]unk' },
      -- }, { mode = 'v' }
      -- )
      -- Decrease mapped sequence wait time
      -- Displays which-key popup sooner
      vim.opt.timeoutlen = 500
    end,
  },
}

return plugin
