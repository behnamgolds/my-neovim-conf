return {
  -- PHPCS installation.
  {
    'praem90/nvim-phpcsf',
    config = function()
      vim.g.nvim_phpcs_config_phpcs_path = 'phpcs'
      vim.g.nvim_phpcs_config_phpcbf_path = 'phpcbf'
      vim.g.nvim_phpcs_config_phpcs_standard = 'WordPress' -- or path to your ruleset phpcs.xml
    end,
  },
}
