if vim.g.vscode then
	-- VSCode extension
	-- set clipboard to global clipboard
	vim.opt.clipboard:append("unnamedplus")

	-- Highlight when yanking (copying) text
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})

	-- Split navigation
	local function win_move(direction)
		local curwin = vim.fn.winnr()
		vim.fn.VSCodeCall("workbench.action.navigate" .. direction)
	end

	-- Keymaps for window navigation/splitting
	vim.keymap.set("n", "<C-h>", function()
		win_move("Left")
	end, { desc = "Move or split window left" })
	vim.keymap.set("n", "<C-j>", function()
		win_move("Down")
	end, { desc = "Move or split window down" })
	vim.keymap.set("n", "<C-k>", function()
		win_move("Up")
	end, { desc = "Move or split window up" })
	vim.keymap.set("n", "<C-l>", function()
		win_move("Right")
	end, { desc = "Move or split window right" })

	-- Escape to stop highlighting after searching
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
else
	-- ordinary Neovim
	require("minimal")
end
