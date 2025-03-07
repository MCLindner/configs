if vim.g.vscode then
    -- VSCode extension
    -- set clipboard to global clipboard
    vim.opt.clipboard:append("unnamedplus")
else
    -- ordinary Neovim
    require("mlindner")
end


