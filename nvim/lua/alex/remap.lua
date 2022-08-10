-- netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<cr>")


-- Telescope
vim.keymap.set("n", "<leader>ff", require'telescope.builtin'.find_files)
vim.keymap.set("n", "<leader>fg", require'telescope.builtin'.live_grep)
