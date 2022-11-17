local rt = {
    tools = {
    --     autoSetHints = true,
    --     hover_with_actions = true,
    --     inlay_hints = {
    --       show_parameter_hints = true,
    --       parameter_hints_prefix = "",
    --       other_hints_prefix = "",
    --   },
    },
    server = {
    --         on_attach = require("kaiz.lsp.handlers").on_attach,
    --         capabilities = require("kaiz.lsp.handlers").capabilities, 
    },
    --
    settings = {
        ["rust-analyzer"] = {
              -- assist = {
              --   importMergeBehavior = "last",
              --   importPrefix = "by_self",
              -- },
              -- diagnostics = {
              --   disabled = { "unresolved-import" }
              -- },
              -- cargo = {
              --   loadOutDirsFromCheck = true
              -- },
              -- procMacro = {
              --   enable = true
              -- },
            checkOnSave = {
                command = "clippy"
            },
            }    
    },
    dap = {
    
    },
}

require('rust-tools').setup(rt)

