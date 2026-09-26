-- Shared keymaps: loaded in both vscode-neovim and regular Neovim.

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- jk to escape in insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
