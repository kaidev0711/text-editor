
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "kaiz.lsp.nv-mason"
require("kaiz.lsp.handlers").setup()
require "kaiz.lsp.nv-nullls"
