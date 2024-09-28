require 'telescope'.setup {
  -- settings for telescope...
}

require 'telescope'.load_extension('fzf')

vim.keymap.set("n", "<leader>ff", require 'telescope.builtin'.find_files)
vim.keymap.set("n", "<leader>fg", require 'telescope.builtin'.live_grep)
