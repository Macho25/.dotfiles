return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug Continue" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        end,
    },
    transparent_background = true,
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- for file icons
        },
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false, -- show dotfiles
                        hide_gitignored = false, -- show files in .gitignore
                    },
                },
                window = {
                    mappings = {
                        ["<CR>"] = "open", -- Enter opens file
                        ["o"] = "open_tab", -- o opens in new tab
                        ["s"] = "open_split", -- s opens in horizontal split
                        ["v"] = "open_vsplit", -- v opens in vertical split
                    },
                },
            })
        end,
    },
}
