
require("mason").setup({
     ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"

        }
    }
})

require("mason-lspconfig").setup()

local servers = {
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "dockerls",
  -- "gopls",
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("kaiz.lsp.handlers").on_attach,
    capabilities = require("kaiz.lsp.handlers").capabilities,
  }

  if server == "pyright" then
    local pyright_opts = require "kaiz.lsp.ftplugin.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  lspconfig[server].setup(opts)
end
