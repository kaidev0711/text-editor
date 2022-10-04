local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "dockerls",
}

lsp_installer.setup({
    ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded"
    }
})

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
