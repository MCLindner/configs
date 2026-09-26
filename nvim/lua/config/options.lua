-- Shared options: loaded in both vscode-neovim and regular Neovim.
-- Env-specific files (config.vscode / config.lazy) add overrides on top.

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.have_nerd_font = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.history = 10000

-- Short mapped-sequence wait so `jk` feels snappy
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

-- Use system clipboard in both environments
vim.opt.clipboard:append("unnamedplus")
