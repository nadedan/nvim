
local auto = vim.api.nvim_create_autocmd

local autogroup = vim.api.nvim_create_augroup("PersonalConfig", { clear = true })

auto("BufWritePre", {
  group = autogroup,
  pattern = "*",
  callback = function()
    -- Save cursor position + current window view (scroll, folds, etc.)
    local save_cursor = vim.fn.getpos(".")
    local save_winline = vim.fn.winline()
    local save_winview = vim.fn.winsaveview()

    -- Skip if it's a special buffer we don't want to touch
    if vim.bo.binary or not vim.bo.modifiable or vim.bo.filetype == "" then
      return
    end

    -- Remove trailing whitespace
    vim.cmd([[keeppatterns %s/\s\+$//e]])

    -- Restore exact cursor position and view
    --    This order is important: first view, then cursor
    if vim.fn.winline() ~= save_winline then
      vim.fn.winrestview(save_winview)
    end
    vim.fn.setpos(".", save_cursor)
  end,
  desc = "Trim trailing whitespace on save (cursor & view preserved)",
})

auto("TextYankPost", {
  group = autogroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

auto({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = autogroup,
  command = "checktime",
})
