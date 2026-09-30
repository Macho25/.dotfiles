return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "xml", -- For .csproj files (c_sharp, c, python come from the lang extras)
            })
        end,
    },
}
