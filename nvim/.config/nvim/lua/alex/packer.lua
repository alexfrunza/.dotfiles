return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

	-- catppuccin colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }


    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        -- newer commits break the syntax highlighting
        commit = '9bfaf62e42bdcd042df1230e9188487e62a112c0'
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

    -- Prettier (js formatter)
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

end)
