vim.g.mapleader = " " -- set leader key before Lazy

require("mlindner.lazy_init")

-- Uncomment a theme!
-- vim.o.background = "light"
-- vim.cmd([[colorscheme gruvbox]])

-- vim.o.background = "dark"
-- vim.cmd([[colorscheme dracula]])
-- Wow!

vim.cmd("tnoremap <esc> <C-\\><C-N>")

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
