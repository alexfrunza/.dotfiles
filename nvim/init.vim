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

set colorcolumn=80

call plug#begin('~/.vim/plugged')
" Gruvbox theme
Plug 'morhetz/gruvbox'

Plug 'neovim/nvim-lspconfig'
Plug 'chemzqm/vim-jsx-improve'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Prisma syntax highlighting
Plug 'pantharshit00/vim-prisma'

" HCL ( Terraform ) syntax highlighting
Plug 'jvirtanen/vim-hcl'

call plug#end()

colorscheme gruvbox
let g:gruvbox_transparent_bg=1

lua << EOF
require'lspconfig'.eslint.setup{}
-- require'lspconfig'.gopls.setup{single_file_support=true}
EOF

let mapleader = " "
