return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  cond = vim.fn.getcwd() == vim.fn.expand '~/Documents/Zk',
  --ft = 'markdown',
  --
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {

    workspaces = {
      {
        name = 'notes',
        path = '~/Documents/Zk',
      },
    },
    templates = {
      folder = '~/Documents/Zk/Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = '0 - Daily Notes/' .. os.date '%Y/%m',
      default_tags = { 'daigy-notes' },
      template = 'Templates/daily.md',
    },
  },
}
