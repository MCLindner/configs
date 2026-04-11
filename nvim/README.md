# Neovim Configuration

## Profiles

Profile is selected in `init.lua` (line 39). Change `require("mlindner")` to `require("minimal")` to switch.

| Profile | Trigger | Description |
|---------|---------|-------------|
| **vscode** | `vim.g.vscode` is set | Minimal keymaps for VSCode extension mode |
| **minimal** | `require("minimal")` | Colorscheme, gitsigns, telescope, treesitter, which-key, zen-mode |
| **mlindner** | `require("mlindner")` | Full IDE — everything in minimal plus LSP, autocomplete, autoformat, DAP, lazydev, opencode |

## Editor Settings

| Option | Value | Effect |
|--------|-------|--------|
| Leader | `<Space>` | Both `mapleader` and `maplocalleader` |
| `tabstop` / `shiftwidth` / `softtabstop` | 4 | 4-space indentation |
| `expandtab` | true | TAB key inserts spaces |
| `number` + `relativenumber` | true | Hybrid line numbers |
| `undofile` | true | Persistent undo history |
| `ignorecase` + `smartcase` | true | Smart case-insensitive search |
| `splitright` / `splitbelow` | true | Splits open to the right/below |
| `scrolloff` | 10 | Keep 10 lines above/below cursor |
| `updatetime` | 250ms | Faster CursorHold events |
| `timeoutlen` | 300ms | Faster which-key popup |
| `clipboard` | `unnamedplus` | Sync with OS clipboard |
| `virtual_text` (diagnostics) | false | Diagnostics show as floats on CursorHold, not inline |

Colorscheme: **dracula** (gruvbox available but inactive).

## Keybindings

### General (all profiles)

| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | n | Clear search highlights |
| `<C-h/j/k/l>` | n | Move focus between windows |
| `<leader>q` | n | Open diagnostic quickfix list |
| `<Esc>` | t | Exit terminal mode |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search select Telescope |
| `<leader>sw` | Grep current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader><leader>` | Find open buffers |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>s/` | Live grep in open files |
| `<leader>sn` | Find files in Neovim config |

### LSP (mlindner — buffer-local on attach)

| Key | Mode | Action |
|-----|------|--------|
| `gd` | n | Goto definition |
| `gr` | n | Goto references |
| `gI` | n | Goto implementation |
| `gD` | n | Goto declaration |
| `<leader>D` | n | Type definition |
| `<leader>ds` | n | Document symbols |
| `<leader>ws` | n | Workspace symbols |
| `<leader>rn` | n | Rename symbol |
| `<leader>ca` | n, x | Code action |
| `<leader>th` | n | Toggle inlay hints |

### Autoformat (mlindner)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>f` | n, v | Format buffer (async, LSP fallback) |

### DAP Debugging (mlindner)

| Key | Action |
|-----|--------|
| `<F5>` | Continue / start debug session |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle DAP UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |

### Autocomplete (mlindner — insert mode)

| Key | Action |
|-----|--------|
| `<C-n>` | Next completion item |
| `<C-p>` | Previous completion item |
| `<C-y>` | Confirm completion |
| `<C-Space>` | Trigger completion |
| `<C-b>` / `<C-f>` | Scroll docs up/down |
| `<C-l>` | LuaSnip: expand or jump forward |
| `<C-h>` | LuaSnip: jump backward |

### Opencode AI (mlindner)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>o` | n, t | Toggle opencode panel |
| `<C-a>` | n, x | Ask opencode about selection |
| `<C-x>` | n, x | Open opencode action picker |
| `go` | n, x | Send range/motion to opencode |
| `goo` | n | Send current line to opencode |
| `<S-C-u>` / `<S-C-d>` | n | Scroll opencode session up/down |
| `+` / `-` | n | Increment/decrement number (remapped from `<C-a>`/`<C-x>`) |

### Treesitter Incremental Selection

| Key | Action |
|-----|--------|
| `gnn` | Init selection |
| `grn` | Expand to next node |
| `grc` | Expand to scope |
| `grm` | Shrink to previous node |

### Which-Key Group Labels

| Prefix | Group |
|--------|-------|
| `<leader>c` | [C]ode |
| `<leader>d` | [D]ocument |
| `<leader>r` | [R]ename |
| `<leader>s` | [S]earch |
| `<leader>w` | [W]orkspace |
| `<leader>t` | [T]oggle |
| `<leader>h` | Git [H]unk |

## Plugins

### Both Profiles

| Plugin | Purpose |
|--------|---------|
| `Mofiqul/dracula.nvim` | Active colorscheme |
| `ellisonleao/gruvbox.nvim` | Alternate colorscheme (inactive) |
| `lewis6991/gitsigns.nvim` | Git gutter signs |
| `folke/snacks.nvim` | Fuzzy picker, `vim.ui.select` replacement |
| `nvim-lualine/lualine.nvim` | Statusline (mode, branch, diagnostics, file, location) |
| `nvim-treesitter/nvim-treesitter` | Syntax highlighting + incremental selection |
| `folke/which-key.nvim` | Keymap popup helper |
| `folke/zen-mode.nvim` | Distraction-free mode (120 col window) |

### mlindner Profile Only

| Plugin | Purpose |
|--------|---------|
| `neovim/nvim-lspconfig` | LSP client configuration |
| `williamboman/mason.nvim` | LSP/tool installer UI |
| `williamboman/mason-lspconfig.nvim` | Mason ↔ lspconfig bridge |
| `WhoIsSethDaniel/mason-tool-installer.nvim` | Declarative tool installation |
| `j-hui/fidget.nvim` | LSP progress spinner |
| `saghen/blink.cmp` | Autocompletion engine (replaces nvim-cmp) |
| `L3MON4D3/LuaSnip` | Snippet engine |
| `stevearc/conform.nvim` | Autoformat on save |
| `mfussenegger/nvim-dap` | Debug Adapter Protocol client |
| `rcarriga/nvim-dap-ui` | DAP UI panels |
| `jay-babu/mason-nvim-dap.nvim` | Mason ↔ DAP bridge |
| `leoluz/nvim-dap-go` | Go debug adapter |
| `mfussenegger/nvim-dap-python` | Python debug adapter |
| `folke/lazydev.nvim` | Lua LSP dev support |
| `nickjvandyke/opencode.nvim` | OpenCode AI integration |
| `folke/snacks.nvim` | Extends shared snacks with opencode UI and picker actions |

## LSP Servers

Managed via Mason. Configured in `lua/mlindner/lazy/lsp.lua`.

| Server | Language |
|--------|----------|
| `clangd` | C / C++ |
| `omnisharp` | C# |
| `basedpyright` | Python |
| `postgres_lsp` | PostgreSQL |
| `gopls` | Go |
| `lua_ls` | Lua (`callSnippet = "Replace"`) |

## Formatters

| Tool | Language | How |
|------|----------|-----|
| `stylua` | Lua | conform.nvim, runs on save |
| `csharpier` | C# | Installed via Mason, LSP fallback only |
| `ruff` | Python | Installed via Mason, LSP fallback only |
| C / C++ | — | Format-on-save **disabled** |

## DAP Adapters

| Adapter | Language | Notes |
|---------|----------|-------|
| `cppdbg` (OpenDebugAD7) | C / C++ | GDB, prompts for executable path |
| `debugpy` | Python | `~/.local/share/nvim/mason/packages/debugpy/venv/bin/python` |
| `delve` | Go | `nvim-dap-go`, non-detached on Linux |

DAP UI opens automatically when a session initializes and closes on termination/exit.

## Treesitter Grammars

`c`, `cpp`, `c_sharp`, `lua`, `vim`, `vimdoc`, `python`, `bash`, `go`
