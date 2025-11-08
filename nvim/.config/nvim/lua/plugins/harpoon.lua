return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            -- Keymaps
            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end, { desc = "Harpoon Add File" })

            vim.keymap.set("n", "<leader>h", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon Menu" })

            -- Harpoon navigation with Alt key
            vim.keymap.set("n", "<A-1>", function()
                harpoon:list():select(1)
            end, { desc = "Harpoon File 1" })

            vim.keymap.set("n", "<A-2>", function()
                harpoon:list():select(2)
            end, { desc = "Harpoon File 2" })

            vim.keymap.set("n", "<A-3>", function()
                harpoon:list():select(3)
            end, { desc = "Harpoon File 3" })

            vim.keymap.set("n", "<A-4>", function()
                harpoon:list():select(4)
            end, { desc = "Harpoon File 5" })

            vim.keymap.set("n", "<A-5>", function()
                harpoon:list():select(5)
            end, { desc = "Harpoon File 5" })
        end,
    },
}
