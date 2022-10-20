local wk = require("which-key")
wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
   presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}


local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

local mappings = {
  a = { "<cmd>Alpha<cr>", "Alpha" },
  q = { ":q<cr>", "Quit" },
  u = { "<Cmd>UrlView buffer picker=telescope<CR>", "view buffer URLs" },
  Q = { ":wq<cr>", "Save & Quit" },
  w = { ":w<cr>", "Save" },
  -- x = { ":delete<cr>", "Close" },
  E = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
  -- f = { ":Telescope find_files<cr>", "Telescope Find Files" },
  -- r = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
  t = {
    name = "Terminal",
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { toggle_float, "Floating Terminal" },
    o = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },

  },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
    -- k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
    w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
    W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
 
    R = { '<cmd>Lspsaga rename<cr>', "Rename" },
    a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
    e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
    n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
    N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" },
    s = { '<Cmd>Lspsaga signature_help<CR>', "signaturre help"},
    p = { '<Cmd>Lspsaga preview_definition<CR>', "Lsp Preview definition"},
    o = { '<Cmd>Lspsaga lsp_finder<CR>',"lsp finder"},
    f = { '<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<cr>', "formatting"}
  },
  z = {
    name = "Focus",
    z = { ":ZenMode<cr>", "Toggle Zen Mode" },
    t = { ":Twilight<cr>", "Toggle Twilight" }
  },
  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  },
  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },  
  },
  d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      f = { "<cmd>lua require('dapui').float_element(<element ID>, <optional settings>)<cr>", "dapui float_element"},
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<CR>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<CR>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<CR>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
    },
  m = {
    name = "Telescope dap",
    c = {'<cmd>lua require"telescope".extensions.dap.commands{}<CR>', "dap commands"},
    p = {'<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', "dap configrations"},
    b = {'<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', "dap list Breakpoint"},
    v = {'<cmd>lua require"telescope".extensions.dap.variables{}<CR>', "dap Variables"},
    f = {'<cmd>lua require"telescope".extensions.dap.frames{}<CR>', "dap frames"},
  },
  x = {
      name = "Trouble",
      x = {"<cmd>TroubleToggle<cr>", "Trouble Toggle"},
      w = {"<cmd>Trouble workspace_diagnostics<cr>", "Trouble workspace_diagnostics"},
      d = {"<cmd>Trouble document_diagnostics<cr>", "Trouble document_diagnostics"},
      l = {"<cmd>Trouble loclist<cr>", "Trouble loclist"},
      q = {"<cmd>Trouble quickfix<cr>", "Trouble quickfix"},
      r = {"<cmd>Trouble lsp_references<cr>", "Trouble lsp_references"},
  },
  n = {'<cmd>lua require"illuminate".toggle()<cr>', "Illuminate"}, 
  f = {
    name = "Telescope",
  }, 
  c = {
        name = "Coding",
        a = { "<cmd>GoCodeAction<cr>", "Code action" },
        e = { "<cmd>GoIfErr<cr>", "Add if err" },
        h = {
          name = "Helper",
          a = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
          r = { "<cmd>GoRMTag<cr>", "Remove tags to struct" },
          c = { "<cmd>GoCoverage<cr>", "Test coverage" },
          g = { "<cmd>lua require('go.comment').gen()<cr>", "Generate comment" },
          v = { "<cmd>GoVet<cr>", "Go vet" },
          t = { "<cmd>GoModTidy<cr>", "Go mod tidy" },
          i = { "<cmd>GoModInit<cr>", "Go mod init" },
        },
        i = { "<cmd>GoToggleInlay<cr>", "Toggle inlay" },
        l = { "<cmd>GoLint<cr>", "Run linter" },
        o = { "<cmd>GoPkgOutline<cr>", "Outline" },
        r = { "<cmd>GoRun<cr>", "Run" },
        s = { "<cmd>GoFillStruct<cr>", "Autofill struct" },
        t = {
          name = "Tests",
          r = { "<cmd>GoTest<cr>", "Run tests" },
          a = { "<cmd>GoAlt!<cr>", "Open alt file" },
          s = { "<cmd>GoAltS!<cr>", "Open alt file in split" },
          v = { "<cmd>GoAltV!<cr>", "Open alt file in vertical split" },
          u = { "<cmd>GoTestFunc<cr>", "Run test for current func" },
          f = { "<cmd>GoTestFile<cr>", "Run test for current file" },
        },
        x = {
          name = "Code Lens",
          l = { "<cmd>GoCodeLenAct<cr>", "Toggle Lens" },
          a = { "<cmd>GoCodeAction<cr>", "Code Action" },
        },
        
      },
    v = {
        name= "split",
        s = {"<cmd>split<cr>", "Split"},
        v = {"<cmd>vsplit<cr>", "Vsplit"},
    },

  -- a = {
  --   name = "hragrs",
  --   t = {"<cmd>lua require('hlargs').toggle()<cr>", "hlagrs treesiter"}
  --   },  
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)

wk.register({
      c = {
        name = "Coding",
        j = { "<cmd>GoJson2Struct<cr>", "Json to struct" },
      },
    }, {   prefix = '<leader>', mode = "v" })
