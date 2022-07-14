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

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Better fuzzy finder for telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Lsp
Plug 'neovim/nvim-lspconfig'

" JavaScript plugins
Plug 'chemzqm/vim-jsx-improve'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Prisma syntax highlighting (nodejs orm)
Plug 'pantharshit00/vim-prisma'

" HCL ( Terraform ) syntax highlighting
Plug 'jvirtanen/vim-hcl'

call plug#end()

" Gruvbox configuration
let g:gruvbox_transparent_bg = 1
colorscheme gruvbox

let mapleader = " "

" Import lua configuration files
lua require("alex")

" lsp show error
nnoremap <leader>e <cmd>lua vim.diagnostic.open_float()<cr>

" Find files using Lua functions (Telescope)
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
