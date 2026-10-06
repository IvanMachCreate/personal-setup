local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { gh 'nvim-mini/mini.nvim' }
vim.pack.add { gh 'rafamadriz/friendly-snippets' }

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
end

require('mini.ai').setup{
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}
require('mini.files').setup()
require('mini.surround').setup()
require('mini.statusline').setup()
require('mini.notify').setup({
  content = {
    format = function(notif)
      return notif.msg
    end,
    },
})
require('mini.cmdline').setup()
require( 'mini.completion' ).setup({
  lsp_completion = {
    auto_setup = true,
  }
})
require('mini.pairs').setup()
local MiniSnippets = require('mini.snippets') 
   MiniSnippets.setup({
     snippets = {
       MiniSnippets.gen_loader.from_lang(),
    },
    expand = {
      insert = function(snippet)
        MiniSnippets.default_insert(snippet, {empty_tabstop = ""})
      end,
    },
})
MiniSnippets.start_lsp_server({ match = false })
vim.api.nvim_create_autocmd("ColorScheme" , {
  callback = function()
    vim.api.nvim_set_hl(0, "MiniSnippetsCurrent", {})
    vim.api.nvim_set_hl(0, "MiniSnippetsCurrentReplace", {})
    vim.api.nvim_set_hl(0, "MiniSnippetsFinal", {})
    vim.api.nvim_set_hl(0, "MiniSnippetsUnvisited",{})
    vim.api.nvim_set_hl(0, "MiniSnippetsVisited", {})
  end,
})
