local set_keymaps = function()
  local opts = { buffer = 0 }

  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions)
  vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references)
  -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
  -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
  -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })

  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
  -- List of diagnostics in telescope
  vim.keymap.set("n", "<leader>dl", require('telescope.builtin').diagnostics, opts)
  -- Show details of an error
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  -- Format code
  -- vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, opts)
  -- Rename a variable
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
end

-- local set_keymaps_js = function()
--   local opts = { buffer = 0 }
-- 
--   vim.opt.tabstop = 2
--   vim.opt.softtabstop = 2
--   vim.opt.shiftwidth = 2
--   vim.opt.expandtab = true
-- 
--   vim.keymap.set("n", "K", vim.lsp.buf.hover)
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
--   vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
--   -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
--   vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
-- 
--   vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
--   vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
--   -- List of diagnostics in telescope
--   vim.keymap.set("n", "<leader>dl", require 'telescope.builtin'.diagnostics, opts)
--   -- Show details of an error
--   vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
--   -- Format code
--   vim.keymap.set("n", "<leader>=", '<cmd>!prettier --write %<cr><cr>', opts)
--   -- Rename a variable
--   vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
-- 
--   vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
-- end


require 'lspconfig'.gopls.setup {
  single_file_support = true,
  on_attach = set_keymaps,
}

require 'lspconfig'.clangd.setup {
  on_attach = set_keymaps,
}

require'lspconfig'.pylsp.setup{
  on_attach = set_keymaps,
}

require 'lspconfig'.eslint.setup {
  on_attach = set_keymaps,
}

require 'lspconfig'.tsserver.setup {
  on_attach = set_keymaps,
}

require 'lspconfig'.rust_analyzer.setup {
  -- You need to install this: https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
  on_attach = set_keymaps,
}

require 'lspconfig'.lua_ls.setup {
  on_attach = set_keymaps,
  settings = {
    Lua = {
      format = {
        enable = true,
        -- Put format options here
        -- NOTE: the value should be STRING!!
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
