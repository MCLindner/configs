return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Files" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help tags" })
        vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "LSP symbols" })
        vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Quick open (Ctrl+P)" })
        vim.keymap.set("n", "<C-Tab>", builtin.buffers, { desc = "Buffers (Ctrl+Tab)" })
    end,
}
