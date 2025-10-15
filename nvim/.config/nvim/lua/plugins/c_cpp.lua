return {
    -- This is the standard plugin for configuring language servers
    "neovim/nvim-lspconfig",

    -- Use the 'opts' key to configure the LSP server
    opts = {
        servers = {
            -- Declare the clangd server
            clangd = {
                -- Tell LazyVim which filetypes it applies to
                filetypes = { "c", "cpp", "h", "hpp" },
                -- Optional: Add extra configurations here if needed,
                -- but default settings are usually sufficient.
            },
        },
    },
}
