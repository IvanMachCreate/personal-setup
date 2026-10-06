local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add{ gh 'neovim/nvim-lspconfig' }
vim.pack.add{ gh 'mfussenegger/nvim-lint' } 

require('lint').linters_by_ft = {
  lua = {'selene3p_ls'},
  nix = {'statix'}
}

vim.lsp.enable('stylua')
vim.lsp.enable('nixd')
vim.lsp.enable('qmlls')
vim.lsp.enable('quick_lint_js')
vim.diagnostic.config({
  virtual_text = true,
  update_on_insert = true
})

