local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buuffer = bufnr})
end)

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {"lua_ls", "rust_analyzer", "clangd", "elixirls", "golangci_lint_ls", "pylyzer", "ruby_lsp", "tsserver"},

  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
