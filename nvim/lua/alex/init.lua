-- lsp (es)lint for javascript
require'lspconfig'.eslint.setup{}
-- lsp for golang
require'lspconfig'.gopls.setup{single_file_support=true}


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
require('telescope').setup{
    -- settings for telescope...
}
require('telescope').load_extension('fzf')
