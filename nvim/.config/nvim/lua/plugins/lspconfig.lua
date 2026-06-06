return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            pyright = {
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            typeCheckingMode = "strict",
                            useLibraryCodeForTypes = true,
                            --           reportUnusedImport = "information",
                            --           reportUnusedVariable = "none",
                            reportMissingTypeStubs = "information",
                            --           reportUnknownMemberType = "none",
                            --           reportUnknownVariableType = "none",
                            --           reportUnknownArgumentType = "none",
                            --           reportGeneralTypeIssues = "none",
                        },
                    },
                },
            },
        },
    },
}
