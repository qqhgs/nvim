require("lspconfig").intelephense.setup {
  cmd = { DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense", "--stdio" },
  on_attach = require("lsp").common_on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = Var.lang.php.diagnostics.virtual_text,
      signs = Var.lang.php.diagnostics.signs,
      underline = Var.lang.php.diagnostics.underline,
      update_in_insert = true,
    }),
  },
  filetypes = Var.lang.php.filetypes,
  settings = {
    intelephense = {
      format = {
        braces = Var.lang.php.format.braces,
      },
      environment = {
        phpVersion = Var.lang.php.environment.php_version,
      },
    },
  },
}
