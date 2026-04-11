return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		input = {}, -- Enhances opencode.nvim ask()
		picker = { -- Enhances opencode.nvim select() and replaces telescope
			ui_select = true, -- replace vim.ui.select with snacks picker
			actions = {
				opencode_send = function(...)
					return require("opencode").snacks_picker_send(...)
				end,
			},
			win = {
				input = {
					keys = {
						["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
					},
				},
			},
		},
	},
}
