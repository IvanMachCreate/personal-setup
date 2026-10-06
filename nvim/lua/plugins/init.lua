local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add({ gh 'alex-popov-tech/store.nvim' })
vim.pack.add({ gh 'NMAC427/guess-indent.nvim'})
vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
vim.pack.add { gh 'folke/tokyonight.nvim' }
vim.pack.add { gh 'luka-reineke/indent-blankline.nvim'}
vim.pack.add{ gh 'catgoose/nvim-colorizer.lua'}

require("ibl").setup() -- indent-blankline 
require("colorizer").setup()
require("guess-indent").setup() 
require('gitsigns').setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
}

require('tokyonight').setup {
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
}

