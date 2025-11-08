return {
    "neovim/nvim-lspconfig",
    -- ... other configuration ...
    opts = {
        servers = {
            pyright = {
                -- Pass your Pyright config here under the 'settings' key
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            typeCheckingMode = "strict",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },
        },
    },
}
