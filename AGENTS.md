# Dotfiles Config

This is a dotfiles repository. Most files go in `~/.config/` on the target machine.

## Neovim Configuration

Location: `nvim/`

### Dual Config Profiles

Selected by `init.lua` (default: `minimal`):
- **VSCode**: Detected via `vim.g.vscode`. Loads minimal VSCode extension keymaps.
- **minimal**: Bare-bones - colorscheme, gitsigns, telescope, treesitter, which-key, zen-mode.
- **mlindner**: Full IDE - adds LSP (clangd, omnisharp, basedpyright, postgrestools, gopls, lua_ls), autocomplete (nvim-cmp + LuaSnip), autoformat (conform.nvim), DAP debugging (nvim-dap with Go/Python/C/C++ adapters), lazydev for Lua dev.

To switch: edit `init.lua` line 39 from `require("minimal")` to `require("mlindner")`.

### Plugin Management

Uses `lazy.nvim`. Plugin specs are in `lua/{profile}/lazy/`. Run `:Lazy` to manage plugins.

### LSP Servers (mlindner profile)

Configured via Mason: `clangd`, `omnisharp`, `basedpyright`, `postgrestools`, `gopls`, `lua_ls`.

### Formatters

- Lua: `stylua` (configured via conform.nvim, runs on save)
- `csharpier` and `ruff` are installed via Mason but not wired into conform — C# and Python format via LSP fallback
- C and C++ format-on-save is explicitly disabled in `autoformat.lua`

### Treesitter Grammars

`c`, `lua`, `vim`, `vimdoc`, `python`, `bash`, `cpp`, `c_sharp`, `go`

### Key Bindings (leader = space)

| Key | Action |
|-----|--------|
| `<leader>sh` | Search help tags |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sd` | Search diagnostics |
| `<leader>/` | Fuzzy search in buffer |
| `<leader>ca` | LSP code action |
| `<leader>rn` | LSP rename |

## Documentation

`nvim/README.md` contains full documentation of the Neovim config including all keybindings, plugins, LSP servers, and DAP adapters. **Keep this file up to date when making changes to the Neovim config.**

## Other Configs

- `tmux/`: tmux.conf (vi mode, clipboard via xclip)
- `starship.toml`: Starship prompt config
- `gh/`: GitHub CLI config and hosts
- `opencode/`: OpenCode plugin dependency


