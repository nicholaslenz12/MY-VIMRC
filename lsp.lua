require'nvim-lsp-installer'.setup{}
require'lspconfig'.julials.setup {
  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "<Leader>ld", vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set("n", "<Leader>ln", vim.lsp.buf.rename, {buffer = 0})
    vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.references, {buffer = 0})
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
  end
}
require"fidget".setup{}
