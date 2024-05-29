return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  event = 'VeryLazy',
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    -- telescope configuration
    -- require('telescope').load_extension 'harpoon'
    -- vim.keymap.set("n", "<C-q>", telescope.extensions.harpoon.marks)
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end
    -- telescope configuration

    -- which-key configuration
    require('which-key').register {
      ['<leader>n'] = { name = 'Harpoo[N]', _ = 'which_key_ignore' },
    }
    -- which-key configuration

    vim.keymap.set('n', '<leader>na', function()
      harpoon:list():add()
    end, { desc = 'Harpoo[N] [A]dd' })

    vim.keymap.set('n', '<leader>nl', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Harpoo[N] [L]ist' })

    -- vim.keymap.set('n', '<leader>nl', function()
    --   harpoon.ui:toggle_quick_menu(harpoon:list())
    -- end, { desc = 'Harpoo[N] [L]ist' })
    --
    vim.keymap.set('n', '<leader>n1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoo[N] Buffer [1]' })
    vim.keymap.set('n', '<leader>n2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoo[N] Buffer [2]' })
    vim.keymap.set('n', '<leader>n3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoo[N] Buffer [3]' })
    vim.keymap.set('n', '<leader>n4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoo[N] Buffer [4]' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>np', function()
      harpoon:list():prev()
    end, { desc = 'Harpoo[N] [P]revious' })
    vim.keymap.set('n', '<leader>nn', function()
      harpoon:list():next()
    end, { desc = 'Harpoo[N] [N]ext' })
  end,
}
