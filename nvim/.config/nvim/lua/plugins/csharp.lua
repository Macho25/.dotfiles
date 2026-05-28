return {
    -- Ensure OmniSharp is installed via Mason
    {
        "mason-org/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "omnisharp", -- C# LSP
                "csharpier", -- C# formatter
                "netcoredbg", -- .NET debugger
            })
        end,
    },

    -- Configure OmniSharp LSP
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                omnisharp = {
                    -- Point to your game's DLLs for better IntelliSense
                    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
                    enable_editorconfig_support = true,
                    enable_ms_build_load_projects_on_demand = false,
                    enable_roslyn_analyzers = true,
                    organize_imports_on_format = true,
                    enable_import_completion = true,
                    sdk_include_prereleases = true,
                    analyze_open_documents_only = false,
                },
            },
        },
    },
}
