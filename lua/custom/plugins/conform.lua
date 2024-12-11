return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('conform').setup {
      settings = {
        tsserver_format_options = {
          insertSpaceBeforeFunctionParenthesis = true,
          insertSpaceAfterConstructor = true,
        },
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'dprint' },
        typescript = { 'dprint' },
        json = { 'dprint' },
        markdown = { 'dprint' },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = false,
      },
      formatters = {
        dprint = {
          require_cwd = true,
        },
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>l', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
