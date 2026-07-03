return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "igorlfs/nvim-dap-view",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapview = require("dap-view")

        -- Signs
        vim.fn.sign_define("DapBreakpoint", { text = "󰨫", texthl = "DiagnosticError" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "󰝣", texthl = "DiagnosticWarn" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticWarn" })
        vim.fn.sign_define("DapLogPoint", { text = "󰐪", texthl = "DiagnosticInfo" })
        vim.fn.sign_define("DapStopped", { text = "󰦉", texthl = "DiagnosticInfo" })

        -- nvim-dap-view setup
        dapview.setup({
            -- Auto open/close with debug sessions (replaces manual dap listeners)
            auto_toggle = true,
            winbar = {
                default_section = "repl",
            },
            hover = {
                border = "rounded",
            },
            virtual_text = {
                enabled = true,
                position = "inline",
            },
        })

        -- mason-nvim-dap: auto-setup adapters/configurations from Mason
        require("mason-nvim-dap").setup({
            automatic_setup = true,
            handlers = {},
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
        vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to Cursor" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
        vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
        vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })
        vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "Terminate" })
        vim.keymap.set("n", "<leader>td", dapview.toggle, { desc = "Toggle DAP View" })
        vim.keymap.set({ "n", "v" }, "<leader>dh", dapview.hover, { desc = "DAP Hover" })
    end,
}
