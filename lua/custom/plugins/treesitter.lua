-- TODO: Get the highlights and language injections(html, css, js) to work with gotmpl
return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'php',
      'php_only',
      'phpdoc',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'css',
      'go',
      'gomod',
      'gotmpl',
      'gosum',
      'gowork',
      'yaml',
      'python',
      'json',
      'javascript',
      'sql',
      'csv',
      'dockerfile',
    },
    -- Autoinstall languages that are not installed
    auto_install = false,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      -- additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    -- smartindent = { enable = false },
  },
  config = function(_, opts)
    -- For detecting go template files
    -- see https://github.com/ngalaiko/tree-sitter-go-template
    vim.filetype.add {
      extension = {
        gotmpl = 'gotmpl',
        gohtml = 'gotmpl',
        tmpl = 'gotmpl',
        gohtmltmpl = 'gotmpl',
        gohtxttmpl = 'gotmpl',
        gohtexttmpl = 'gotmpl',
      },
    }
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
    parser_configs['gotmpl'] = {
      install_info = {
        url = 'https://github.com/ngalaiko/tree-sitter-go-template',
        files = { 'src/parser.c' },
      },
      filetype = 'gotmpl',
      used_by = { 'gohtmltmpl', 'gotexttmpl', 'gotmpl', 'gotxttmpl', 'gohtml', 'tmpl' },
    }
    -- For detecting go template files

    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
