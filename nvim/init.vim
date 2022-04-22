set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set hidden
set nowrap
set scrolloff=8
set ruler
set termguicolors

set colorcolumn=80

call plug#begin('~/.vim/plugged')
" Gruvbox theme
Plug 'gruvbox-community/gruvbox'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope fuzzyfinder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'

" JavaScript plugins
Plug 'chemzqm/vim-jsx-improve'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Prisma syntax highlighting
Plug 'pantharshit00/vim-prisma'

" HCL ( Terraform ) syntax highlighting
Plug 'jvirtanen/vim-hcl'

call plug#end()

" Gruvbox configuration
let g:gruvbox_transparent_bg = 1
colorscheme gruvbox

lua << EOF
require'lspconfig'.eslint.setup{}
-- lsp for golang
-- require'lspconfig'.gopls.setup{single_file_support=true}
EOF

let mapleader = " "

" lsp show error
nnoremap <leader>e <cmd>lua vim.diagnostic.open_float()<cr>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
