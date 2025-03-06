return {
    {"neovim/nvim-lspconfig",
    config = function()
        require('lspconfig').clangd.setup {}
	require('lspconfig').basedpyright.setup {}	
    end,
    }		
}	
