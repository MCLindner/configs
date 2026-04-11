return {
	"nickjvandyke/opencode.nvim",
	version = "*", -- Latest stable release
	dependencies = { "folke/snacks.nvim" },
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {}

		-- Required for buffer auto-reload when opencode edits files
		vim.o.autoread = true

		-- Toggle opencode panel
		vim.keymap.set({ "n", "t" }, "<leader>o", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })

		-- Ask opencode about the current selection/position
		vim.keymap.set({ "n", "x" }, "<C-a>", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode" })

		-- Open opencode action picker
		vim.keymap.set({ "n", "x" }, "<C-x>", function()
			require("opencode").select()
		end, { desc = "opencode action picker" })

		-- Operator motion: send range/motion to opencode
		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this ")
		end, { desc = "Send range to opencode", expr = true })
		vim.keymap.set("n", "goo", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Send line to opencode", expr = true })

		-- Scroll opencode session
		vim.keymap.set("n", "<S-C-u>", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "Scroll opencode up" })
		vim.keymap.set("n", "<S-C-d>", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "Scroll opencode down" })

		-- Remap increment/decrement since <C-a>/<C-x> are taken above
		vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
		vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
	end,
}
