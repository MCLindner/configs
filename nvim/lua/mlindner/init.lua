vim.g.mapleader = " " -- set leader key before Lazy

require("mlindner.lazy_init")

-- Uncomment a theme!
-- vim.o.background = "light"
-- vim.cmd([[colorscheme gruvbox]])

-- vim.o.background = "dark"
-- vim.cmd([[colorscheme dracula]])
-- Wow!

vim.cmd("tnoremap <esc> <C-\\><C-N>")
