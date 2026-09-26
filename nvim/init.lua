-- Shared config first (sets mapleader/maplocalleader before lazy loads,
-- so plugin mappings resolve correctly in both environments).
require("config.options")
require("config.autocmds")
require("config.keymaps")

if vim.g.vscode then
	require("config.vscode")
else
	require("config.lazy")
end
