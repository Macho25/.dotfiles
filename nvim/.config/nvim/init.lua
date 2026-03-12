-- bootstrap lazy.nvim, lazyvim and your plugins
require("config.lazy")

require("config.keymaps")

require("config.plugins")

require("config.lazy")

require("config.options")
-- require("image").setup({
-- backend = "sixel",
-- processor = "magick_cli",
-- integrations = {
--     markdown = { enabled = true },
-- },
-- })
-- vim.lsp.enable("pyright")
require("lspconfig").jsonls.setup({
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})
vim.opt.termguicolors = true
vim.cmd("colorscheme tokyonight-night")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = {
        "*/i3/config",
        "*/.config/i3/config",
        "*/.dotfiles/i3/.config/i3/config",
    },
    callback = function()
        vim.bo.filetype = "i3config"
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = {
        ".bash_*",
        "*.bash_*",
        "*/.bash_*",
    },
    callback = function()
        vim.bo.filetype = "sh"
    end,
})
