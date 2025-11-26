
-- Bootstrap capabilities for nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Go LSP setup
vim.lsp.config('gopls', {
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  capabilities = capabilities,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      gofumpt = true,        -- stricter gofmt
      hints = {               -- inlay hints (super nice in Go!)
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.lsp.start({
      name = "gopls",
      cmd = { "gopls" },
      root_dir = vim.fs.dirname(vim.fs.find({ "go.mod", ".git" }, { upward = true })[1]),
      capabilities = capabilities,
    })
    vim.bo.tabstop    = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  end,
})

-- Optional: better diagnostics look
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Global keymaps (you can put these in a separate file too)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufmap = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
    end

    bufmap('n', 'gd',         vim.lsp.buf.definition,      'Go to definition')
    bufmap('n', 'gD',         vim.lsp.buf.declaration,     'Go to declaration')
    bufmap('n', 'gi',         vim.lsp.buf.implementation,  'Go to implementation')
    bufmap('n', 'gr',         vim.lsp.buf.references,      'Find references')
    bufmap('n', 'K',         vim.lsp.buf.hover,           'Hover documentation')
    bufmap('n', '<leader>rn', vim.lsp.buf.rename,         'Rename symbol')
    bufmap('n', '<leader>ca', vim.lsp.buf.code_action,     'Code action')
    bufmap('n', '<leader>df', vim.diagnostic.goto_next,    'Next diagnostic')
    bufmap('n', '<leader>db', vim.diagnostic.goto_prev,    'Prev diagnostic')
    bufmap('i', '<C-k>',      vim.lsp.buf.signature_help,  'Signature help')
  end,
})
