-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Works in terminal mode
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
-- Works in visual mode
vim.keymap.set("v", "jk", "<Esc>", { desc = "Exit visual mode" })

local M = {}

M.general = {
    n = {
        vim.keymap.set("n", "<C-h>", ":silent !tmux select-pane -L<CR>", { noremap = true, silent = true }),
        vim.keymap.set("n", "<C-l>", ":silent !tmux select-pane -R<CR>", { noremap = true, silent = true }),
        vim.keymap.set("n", "<C-j>", ":silent !tmux select-pane -D<CR>", { noremap = true, silent = true }),
        vim.keymap.set("n", "<C-k>", ":silent !tmux select-pane -U<CR>", { noremap = true, silent = true }),
    },
    vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true }),
    vim.keymap.set("v", "<leader>R", [[:<C-u>%s/\%V<C-r>=escape(@",'/')<CR>/\=input("Replace with: ")/g<CR>]]),
}
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.lsp.buf.signature_help()
    end,
})
return M
