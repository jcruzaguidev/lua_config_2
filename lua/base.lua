vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.g.mapleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.ai = true -- Auto indent
vim.opt.autoindent = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.backup = false
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.laststatus = 2
vim.opt.mouse = 'a'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 3
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.si = true -- Smart indent
vim.opt.smarttab = true
vim.opt.tabstop = 3
vim.opt.title = true
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wrap = true -- No wrap lines
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
   pattern = '*',
   command = 'set nopaste'
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
