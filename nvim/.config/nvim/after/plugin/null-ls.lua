local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        require("null-ls").builtins.formatting.prettier
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd("nnoremap <silent><buffer> <Leader>= :lua vim.lsp.buf.format()<CR>")

            -- format on save
            -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.cmd("xnoremap <silent><buffer> <Leader>= :lua vim.lsp.buf.range_formatting({})<CR>")
        end
    end,
})
