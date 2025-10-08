return {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
        local ok, sig = pcall(require, "lsp_signature")
        if not ok then
            vim.notify("lsp_signature not found!", vim.log.levels.ERROR)
            return
        end

        sig.setup({
            bind = true,
            floating_window = true,
            handler_opts = { border = "rounded" },

            -- 🩹 Fixes "Invalid 'width': Number is not integral"
            max_width = 80,
            max_height = 12,
            fix_pos = true,
            zindex = 50,
            padding = "",

            hint_enable = true,
            hint_prefix = "󰏫 ",
            hint_scheme = "String",

            -- Make it less annoying
            toggle_key = "<M-x>", -- Alt+x to toggle during insert
            transparency = 5,
            always_trigger = false,
        })

        -- 🧠 Manual trigger in NORMAL mode (you’ll love this)
        vim.keymap.set("n", "<leader>s", function()
            local ok2, sig2 = pcall(require, "lsp_signature")
            if ok2 then
                sig2.toggle_float_win()
            end
        end, { noremap = true, silent = true, desc = "Toggle LSP signature help" })

        -- Optional: auto-show when hovering a function in normal mode
        vim.keymap.set("n", "gh", function()
            vim.lsp.buf.signature_help()
        end, { noremap = true, silent = true, desc = "Show signature help (normal mode)" })
    end,
}
