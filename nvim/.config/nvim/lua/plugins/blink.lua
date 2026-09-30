-- Completion menu keybindings (on top of LazyVim's "enter" preset)
-- <C-n>/<C-p> to navigate, <C-d>/<C-f> to scroll docs, <C-e> to abort, <CR> to confirm
return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            ["<C-d>"] = { "scroll_documentation_up", "fallback" },
        },
        signature = { enabled = true },
    },
}
