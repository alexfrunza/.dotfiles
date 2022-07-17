-- lsp (es)lint for javascript
require'lspconfig'.eslint.setup{}
-- lsp for golang
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
        vim.keymap.set("n", "<ledaer>e", vim.diagnostic.open_float, {buffer=0})
        -- Format code
        vim.keymap.set("n", "<leader>p", vim.lsp.buf.format, {buffer=0})
        -- Rename a variable
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    end
}


-- Treesitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names
    ensure_installed = { "c", "python", "go", "cpp", "css", "html", "javascript" },

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- Telescope
require'telescope'.setup{
    -- settings for telescope...
}
require'telescope'.load_extension('fzf')

-- Mappings

-- Telescope
vim.keymap.set("n", "<leader>ff", require'telescope.builtin'.find_files)
vim.keymap.set("n", "<leader>fg", require'telescope.builtin'.live_grep)
