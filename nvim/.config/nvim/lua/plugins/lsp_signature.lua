return {
    "ray-x/lsp_signature.nvim",
    -- This ensures the plugin loads when you enter insert mode, enabling auto-popups.
    event = "InsertEnter",
    opts = {
        -- Required to use the handler_opts border settings
        bind = true,
        handler_opts = {
            border = "rounded",
            close_events = {
                "BufLeave",
                "CursorMoved",
                "InsertEnter",
                "InsertLeave",
            },
        },
        -- Auto pop-up when typing function calls:
        floating_window = true,
        -- Other automatic pop-up configuration is the default, which is good.
    },
    -- The 'config' function runs after the plugin is installed and loaded.
    keys = {
        {
            "<Leader>si", -- <Space>si for "Signature Info" - a completely unused combination
            function()
                require("lsp_signature").toggle_float_win()
            end,
            mode = "n",
            desc = "Toggle LSP Signature",
        },
    },
}
