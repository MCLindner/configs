if vim.g.vscode then
	-- ============================================================
	-- VSCode (vscode-neovim) configuration
	-- ============================================================
	local vscode = require("vscode")

	-- Run a VSCode command from a keymap
	local function action(name)
		return function()
			vscode.action(name)
		end
	end

	-- ===== Vim core options =====
	vim.g.mapleader = " " -- vim.leader = "<space>"
	vim.g.maplocalleader = " "
	vim.opt.hlsearch = true -- vim.hlsearch
	vim.opt.smartcase = true -- vim.smartcase
	vim.opt.ignorecase = true -- vim.ignorecase
	vim.opt.incsearch = true -- vim.incsearch
	vim.opt.gdefault = true -- vim.gdefault
	vim.opt.history = 10000 -- vim.history
	vim.opt.scrolloff = 5 -- editor.cursorSurroundingLines = 5

	-- set clipboard to global clipboard (vim.useSystemClipboard = true)
	vim.opt.clipboard:append("unnamedplus")

	-- Highlight when yanking (copying) text (vim.highlightedyank.enable = true)
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})

	-- ============================================================
	-- Normal-mode key bindings
	-- ============================================================

	-- Escape to stop highlighting after searching (:nohl)
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

	-- Window navigation: <C-h/j/k/l>
	vim.keymap.set("n", "<C-h>", action("workbench.action.navigateLeft"), { desc = "Navigate window left" })
	vim.keymap.set("n", "<C-j>", action("workbench.action.navigateDown"), { desc = "Navigate window down" })
	vim.keymap.set("n", "<C-k>", action("workbench.action.navigateUp"), { desc = "Navigate window up" })
	vim.keymap.set("n", "<C-l>", action("workbench.action.navigateRight"), { desc = "Navigate window right" })

	-- Multi-cursor (mirrors terryma/vim-multiple-cursors)
	vim.keymap.set("n", "<C-n>", action("editor.action.addSelectionToNextFindMatch"), { desc = "Add cursor at next match" })

	-- Q: format whole document (Q -> gq style)
	vim.keymap.set("n", "Q", action("editor.action.formatDocument"), { desc = "Format document" })

	-- ----- Leader actions (leader = <space>) -----
	vim.keymap.set("n", "<leader>h", action("editor.action.showHover"), { desc = "Show hover info" })
	vim.keymap.set("n", "<leader>qi", action("editor.action.peekImplementation"), { desc = "Quick implementations" })
	vim.keymap.set("n", "<leader>sf", action("workbench.action.quickOpen"), { desc = "Go to file" })
	vim.keymap.set("n", "<leader>d", action("workbench.action.debug.start"), { desc = "Start debug" })
	vim.keymap.set("n", "<leader>b", action("editor.debug.action.toggleBreakpoint"), { desc = "Toggle breakpoint" })
	vim.keymap.set("n", "<leader>z", action("workbench.action.toggleZenMode"), { desc = "Toggle Zen mode" })
	vim.keymap.set("n", "<leader>tp", action("workbench.view.explorer"), { desc = "Explorer (project)" })
	vim.keymap.set("n", "<leader>tt", action("workbench.action.terminal.toggleTerminal"), { desc = "Toggle terminal" })
	vim.keymap.set("n", "<leader>tg", action("workbench.view.scm"), { desc = "Source control" })
	vim.keymap.set("n", "<leader>tc", action("workbench.action.toggleAuxiliaryBar"), { desc = "Toggle aux-bar (Devmate)" })
	vim.keymap.set("n", "<leader>rn", action("editor.action.rename"), { desc = "Rename symbol" })
	vim.keymap.set("n", "<leader>rf", action("editor.action.formatDocument"), { desc = "Reformat document" })

	-- ----- Devmate / Metamate prefix: <leader>a (a = AI) -----
	vim.keymap.set("n", "<leader>an", action("metamate.chat.new"), { desc = "New chat session" })
	vim.keymap.set("n", "<leader>ao", action("metamate.chat.panel.open"), { desc = "Open / focus chat" })
	vim.keymap.set("n", "<leader>ai", action("code-compose.show-inline-comment"), { desc = "Inline chat" })
	vim.keymap.set("n", "<leader>af", action("code-compose.add-file-to-context"), { desc = "Add file to context" })
	vim.keymap.set("n", "<leader>aa", action("code-compose.add-user-selection-to-context"), { desc = "Add selection to context" })
	vim.keymap.set("n", "<leader>am", action("code-compose.cycle-conversation-mode"), { desc = "Cycle conversation mode" })
	vim.keymap.set("n", "<leader>ae", action("code-compose.execute-plan"), { desc = "Execute plan" })
	vim.keymap.set("n", "<leader>ar", action("code-compose.review-code"), { desc = "Review code" })
	vim.keymap.set("n", "<leader>as", action("devmate.toggleSessionsList"), { desc = "Sessions list" })
	vim.keymap.set("n", "<leader>ah", action("devmate.chat.showHistory"), { desc = "Chat history" })
	vim.keymap.set("n", "<leader>ay", action("devmate.sidebar.acceptAll"), { desc = "Accept all edits" })
	vim.keymap.set("n", "<leader>ax", action("devmate.sidebar.discardAll"), { desc = "Discard all edits" })
	vim.keymap.set("n", "<leader>av", action("devmate.sidebar.viewAllSuggestedEdits"), { desc = "View all edits" })

	-- ============================================================
	-- Visual-mode key bindings
	-- ============================================================
	vim.keymap.set("x", "<leader>tc", action("workbench.action.toggleAuxiliaryBar"), { desc = "Toggle aux-bar" })

	-- Multi-cursor (terryma/vim-multiple-cursors style)
	vim.keymap.set("x", "<C-n>", action("editor.action.addSelectionToNextFindMatch"), { desc = "Add next occurrence" })
	vim.keymap.set("x", "<C-x>", action("editor.action.moveSelectionToNextFindMatch"), { desc = "Skip occurrence" })

	-- Format selection / rename
	vim.keymap.set("x", "<leader>rf", action("editor.action.formatSelection"), { desc = "Format selection" })
	vim.keymap.set("x", "<leader>rn", action("editor.action.rename"), { desc = "Rename symbol" })

	-- Devmate / Metamate with the current selection
	vim.keymap.set("x", "<leader>aa", action("code-compose.add-user-selection-to-context"), { desc = "Add selection to context" })
	vim.keymap.set("x", "<leader>af", action("code-compose.add-file-to-context"), { desc = "Add file to context" })
	vim.keymap.set("x", "<leader>ao", action("metamate.chat.panel.open"), { desc = "Open / focus chat" })
	vim.keymap.set("x", "<leader>ai", action("code-compose.show-inline-comment"), { desc = "Inline chat on selection" })
	vim.keymap.set("x", "<leader>ar", action("code-compose.review-code"), { desc = "Review selection" })
	vim.keymap.set("x", "<leader>ah", action("devmate.chat.showHistory"), { desc = "Chat history" })
end

else
	-- ordinary Neovim
	require("mlindner")
end
