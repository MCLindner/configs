-- Shared keymaps: loaded in both vscode-neovim and regular Neovim.

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- jj to escape in insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
