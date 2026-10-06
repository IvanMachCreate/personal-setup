vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
vim.opt.guicursor = ""
vim.opt.scroll = 10
vim.opt.scrolloff = 10


vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true
vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")

vim.o.cmdheight = 0

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    callback = function()
        vim.hl.on_yank()
    end,
})

