-- bootstrap lazy.nvim, lazyvim and your plugins
require("config.lazy")

require("config.keymaps")

require("config.plugins")

require("image").setup({
    backend = "sixel",
    processor = "magick_cli",
    -- integrations = {
    --     markdown = { enabled = true },
    -- },
})
-- vim.lsp.enable("pyright")
