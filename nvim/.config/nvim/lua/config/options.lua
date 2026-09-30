-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Treat ~/.bash_aliases, ~/.bash_functions, ... as shell scripts
vim.filetype.add({
    pattern = {
        [".*/%.bash_.*"] = "sh",
    },
})
