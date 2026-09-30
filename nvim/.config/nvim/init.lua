-- Bootstrap lazy.nvim, LazyVim, and your plugins
require("config.lazy")

-- Load keymaps and options
require("config.keymaps")
require("config.options")

-- Set filetype for i3 config files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = {
        "*/i3/config",
        "*/.config/i3/config",
        "*/.dotfiles/i3/.config/i3/config",
    },
    callback = function(args)
        vim.bo[args.buf].filetype = "i3config"
    end,
})

-- Set filetype for .bash_* files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = {
        ".bash_*",
        "*.bash_*",
        "*/.bash_*",
    },
    callback = function(args)
        vim.bo[args.buf].filetype = "sh"
    end,
})
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.codeLensProvider then
            client.server_capabilities.codeLensProvider = nil
        end
    end,
})
