return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"python",
				"bash",
				"cpp",
				"c_sharp",
				"go",
			},
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			ignore_install = {},
		})
	end,
}
