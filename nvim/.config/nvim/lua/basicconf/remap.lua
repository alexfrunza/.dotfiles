-- netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<cr>")

-- Telescope
vim.keymap.set("n", "<leader>ff", require 'telescope.builtin'.find_files)
vim.keymap.set("n", "<leader>fg", require 'telescope.builtin'.live_grep)

vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode<cr>")

-- Lsp
vim.keymap.set("n", "<leader>lp", "<cmd>LspStop<cr>")
vim.keymap.set("n", "<leader>ls", "<cmd>LspStart<cr>")

-- vim.keymap.set("n", "<leader>=", "<cmd>lua require('conform').format()<cr>")
