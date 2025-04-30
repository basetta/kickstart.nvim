return {
  'olimorris/codecompanion.nvim',
  config = function()
    tools = {
      files = {
        cmd = 'fd', -- or "rg", or whatever your tool is
      },
    }
    require('codecompanion').setup {
      opts = {
        log_level = 'TRACE', -- or "TRACE"
      },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
