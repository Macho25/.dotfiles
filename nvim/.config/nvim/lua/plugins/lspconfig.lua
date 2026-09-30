return {
    "neovim/nvim-lspconfig",
    opts = {
        diagnostics = {
            virtual_text = false,
            float = { border = "rounded" },
        },
        servers = {
            omnisharp = { enabled = false },
            csharp_ls = { enabled = false },
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
        codelens = {
            enabled = false,
        },
    },
}
