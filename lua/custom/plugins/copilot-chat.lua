local keys = {
  {
    '<leader>ccq',
    function()
      local input = vim.fn.input 'Quick Chat: '
      if input ~= '' then
        require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
      end
    end,
    desc = 'CopilotChat - Quick chat',
  },
  -- Show prompts actions with telescope
  {
    '<leader>ccp',
    function()
      local actions = require 'CopilotChat.actions'
      require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
    end,
    desc = 'CopilotChat - Prompt actions',
  },
}
return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
      { 'nvim-telescope/telescope.nvim' },
    },
    keys = keys,
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      show_help = true, -- Show help actions
      auto_follow_cursor = false, -- Don't follow the cursor after getting response
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
