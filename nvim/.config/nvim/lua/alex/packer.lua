return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- GRUVBOX colorscheme
    use 'ellisonleao/gruvbox.nvim'


    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Telescope and dependencies
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Better fuzzy finder for telescope
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    -- Lsp helper
    use 'neovim/nvim-lspconfig'

end)
