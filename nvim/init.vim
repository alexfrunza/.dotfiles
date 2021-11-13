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
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'chemzqm/vim-jsx-improve'
call plug#end()

colorscheme gruvbox

lua << EOF
require'lspconfig'.eslint.setup{}
EOF
