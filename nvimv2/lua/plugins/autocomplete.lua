return {
    "saghen/blink.cmp",
    version = "*", -- Use latest stable release
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            -- jsregexp is optional and needs `make` + a C compiler, which
            -- Windows lacks by default. Skip the build step there.
            build = (not jit.os:find("Windows")) and "make install_jsregexp" or nil,
        },
    },
    opts = {
        snippets = { preset = "luasnip" },
        keymap = {
            preset = "none",
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-y>"] = { "accept", "fallback" },
            ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-l>"] = { "snippet_forward", "fallback" },
            ["<C-h>"] = { "snippet_backward", "fallback" },
        },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100, -- show lazydev completions above lsp
                },
            },
        },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
        },
    },
}
