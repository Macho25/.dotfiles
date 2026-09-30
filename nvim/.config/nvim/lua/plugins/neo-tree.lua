return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        -- { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
        -- { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
        { "<leader>E", "<cmd>Neotree position=right toggle=true dir=cwd<CR>", desc = "Explorer NeoTree (cwd)" },
        { "<leader>e", "<cmd>Neotree position=right toggle dir=cwd<CR>", desc = "Toggle file explorer" },
    },
    opts = {
        filesystem = {
            window = {
                position = "right",
            },
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
        window = {
            position = "right",
            mappings = {
                ["<CR>"] = "open",
                ["o"] = "open_tab",
                ["s"] = "open_split",
                ["v"] = "open_vsplit",
            },
        },
    },
}
