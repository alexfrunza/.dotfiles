local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Best color scheme
  { "catppuccin/nvim",                 name = "catppuccin" },
  -- Treesitter, syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- Telescope and dependencies, this help to navigate in a project
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
    -- Suggested dependencies, maybe some warnings will appear if not
    -- installed
    -- https://github.com/sharkdp/fd
    -- https://github.com/BurntSushi/ripgrep
  },
  -- Better fuzzy finder for telescope
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  -- Lsp helper, lsp help with errors
  { 'neovim/nvim-lspconfig' },
  { 'MunifTanjim/prettier.nvim' },
  -- Icons
  { 'nvim-tree/nvim-web-devicons' },
  { "folke/zen-mode.nvim" },
  { "sindrets/diffview.nvim" },
  { "tpope/vim-fugitive" },
})
