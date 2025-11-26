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
