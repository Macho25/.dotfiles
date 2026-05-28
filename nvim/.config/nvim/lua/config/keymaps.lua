-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set<cmd> https<cmd>//github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Set keymaps
local keymap = vim.keymap.set

-- General keymaps
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit file" })
keymap("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Quir file without saving" })

-- LSP signature specific keymap
keymap({ "n", "i" }, "<C-s>", function()
    require("lsp_signature").toggle_float_win()
end, { desc = "Toggle signature help" })

keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Works in terminal mode
keymap("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
-- Works in visual mode
keymap("v", "jk", "<Esc>", { desc = "Exit visual mode" })

keymap("n", "<C-h>", "<cmd>silent !tmux select-pane -L<CR>", { noremap = true, silent = true })
keymap("n", "<C-l>", "<cmd>silent !tmux select-pane -R<CR>", { noremap = true, silent = true })
keymap("n", "<C-j>", "<cmd>silent !tmux select-pane -D<CR>", { noremap = true, silent = true })
keymap("n", "<C-k>", "<cmd>silent !tmux select-pane -U<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
keymap("v", "<leader>R", [[<cmd><C-u>%s/\%V<C-r>=escape(@",'/')<CR>/\=input("Replace with<cmd> ")/g<CR>]])

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
-- 💾 Save File
keymap("n", "<Leader>w", "<cmd>w<CR>", { desc = "Save File" })

-- 🔁 Toggle Diagnostics (Turn the red/yellow underlines off/on)
keymap("n", "<Leader>ud", "<cmd>LazyVim<cmd>ToggleDiagnostics<CR>", { desc = "Toggle Diagnostics" })

-- 🔎 Search Current File
keymap("n", "<Leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy Find in Current Buffer" })
-- Yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y')

-- Paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p')

local dap = require("dap")
keymap("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
keymap("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
keymap("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
keymap("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
keymap("n", "<leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Conditional Breakpoint" })

-- C# Specific
keymap("n", "<leader>mb", "<cmd>TermExec cmd='./build.sh'<cr>", { desc = "Build Mod" })
keymap("n", "<leader>mt", "<cmd>TermExec cmd='dotnet test'<cr>", { desc = "Run Tests" })

-- LSP (LazyVim defaults, but here for reference)
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- Debugging
keymap("n", "<F5>", require("dap").continue, { desc = "Debug: Start/Continue" })
keymap("n", "<F10>", require("dap").step_over, { desc = "Step Over" })
keymap("n", "<F11>", require("dap").step_into, { desc = "Step Into" })
keymap("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
keymap("n", "<leader>dr", require("dap").repl.open, { desc = "Open Debug REPL" })

-- View game logs
keymap("n", "<leader>ml", function()
    vim.cmd("edit " .. vim.fn.expand("~/.steam/steam/steamapps/common/Colony\\ Survival/gamedata/logs/game.log"))
end, { desc = "Open Game Log" })
