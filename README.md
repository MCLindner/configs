# configs

## Editor division of labor
- **Neovim (terminal):** fast editing. Telescope (`<leader>sf/sg/sb/sh/ss`), diagnostics (`<leader>q/ql`), minimal completion, gutter git signs only.
- **VSCodium + vscode-neovim:** IDE work. Same search prefix (minus `sh`, which is nvim-only help), AI (`<leader>a`), UI toggles (`<leader>t`), debug `F`-keys, SCM.
- **Shared everywhere:** `<C-h/j/k/l>` window nav (Ghostty passthrough), `jj`/`<Esc>`, `<C-p>` quick-open.
