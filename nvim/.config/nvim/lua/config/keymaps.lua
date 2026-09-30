-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set

-- General keymaps (save: <C-s>, quit all: <leader>qq)
keymap("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Quit file without saving" })

keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })
keymap("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
keymap("v", "jk", "<Esc>", { desc = "Exit visual mode" })

-- Replace the last yanked text inside the visual selection
keymap(
    "v",
    "<leader>R",
    [[:<C-u>%s/\%V<C-r>=escape(@",'/')<CR>/\=input("Replace with: ")/g<CR>]],
    { desc = "Replace in selection" }
)

-- Keep the cursor centered
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- 🔎 Search Current File
keymap("n", "<leader>sf", function()
    Snacks.picker.lines()
end, { desc = "Fuzzy Find in Current Buffer" })

-- C# Specific
keymap("n", "<leader>mb", function()
    Snacks.terminal("./build.sh")
end, { desc = "Build Mod" })
keymap("n", "<leader>mt", function()
    Snacks.terminal("dotnet test")
end, { desc = "Run Tests" })

-- View game logs
keymap("n", "<leader>ml", function()
    vim.cmd.edit(
        vim.fn.fnameescape(vim.fn.expand("~/.steam/steam/steamapps/common/Colony Survival/gamedata/logs/game.log"))
    )
end, { desc = "Open Game Log" })
