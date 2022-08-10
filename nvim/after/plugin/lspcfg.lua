require'lspconfig'.gopls.setup{
    single_file_support=true,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
        -- List of diagnostics in telescope
        vim.keymap.set("n", "<leader>dl", require'telescope.builtin'.diagnostics, {buffer=0})
        -- Show details of an error
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {buffer=0})
        -- Format code
        vim.keymap.set("n", "<leader>p", vim.lsp.buf.format, {buffer=0})
        -- Rename a variable
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    end
}

