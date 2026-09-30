-- clangd writes its info logs to stderr, which Neovim stores as ERROR in lsp.log
return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        local clangd = opts.servers.clangd
        if clangd and clangd.cmd then
            table.insert(clangd.cmd, "--log=error")
        end
    end,
}
