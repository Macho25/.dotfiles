-- Declared as `keys` so LazyVim's <C-h/j/k/l> window maps don't override them
return {
    "christoomey/vim-tmux-navigator",
    cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious" },
    keys = {
        { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left (vim/tmux)" },
        { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down (vim/tmux)" },
        { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up (vim/tmux)" },
        { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right (vim/tmux)" },
    },
}
