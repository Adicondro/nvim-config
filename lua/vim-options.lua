vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.background = "light"

vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = false

-- Provider
vim.g.ruby_host_prog = "neovim-ruby-host"
vim.g.perl_host_prog = "/opt/homebrew/bin/perl"
vim.g.ruby_host_prog = "/opt/homebrew/lib/ruby/gems/4.0.0/bin/neovim-ruby-host"

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')


