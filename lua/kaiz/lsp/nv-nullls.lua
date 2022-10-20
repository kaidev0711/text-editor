local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- formatting.eslint,
	-- formatting.autopep8,
	formatting.gofumpt,
    formatting.goimports,
    -- formatting.golines,
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } },
    diagnostics.flake8,
}


local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = sources,
    debug = false,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({ bufnr = bufnr })
                    -- vim.lsp.buf.format({ timeout_ms = 2000 })
                end,
            })
        end
    end,
    })
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({timeout_ms=2000})' ]])

