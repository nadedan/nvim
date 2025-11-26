local o  = vim.opt
local wo = vim.wo
local bo = vim.bo
local g  = vim.g

-----------------------------------------------------------------
-- General behaviour
-----------------------------------------------------------------
o.hidden        = true
o.autoread      = true
o.history       = 1000
o.backspace     = "indent,eol,start"
o.virtualedit   = "all"
o.fileformat    = "unix"
o.fileformats   = "unix,dos"

-- No swap / backup files
o.swapfile     = false
o.backup       = false
o.writebackup  = false

-- Persistent undo (XDG-compliant)
do
  local undodir = vim.fn.expand("~/.local/state/nvim/undo")
  vim.fn.mkdir(undodir, "p", 0x700)
  o.undodir = undodir
  o.undofile = true
end

-----------------------------------------------------------------
-- Appearance & UI
-----------------------------------------------------------------

wo.number         = true
wo.relativenumber = true
wo.cursorline     = true
wo.cursorcolumn   = true
wo.signcolumn     = "yes"
wo.wrap           = false

o.laststatus = 2
o.showmode   = true
o.showcmd    = true
o.ruler      = true
o.cmdheight  = 1

-- After colorscheme
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
-- Optional: also hide line-number background for total seamless look
vim.api.nvim_set_hl(0, "LineNr",       { bg = "NONE", fg = "#928374" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", fg = "#fabd2f", bold = true })


-----------------------------------------------------------------
-- Cursor & bells
-----------------------------------------------------------------
vim.opt.guicursor = "n-v-c-sm:hor20,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.guicursor:append("a:blinkon0")

o.visualbell = true
o.errorbells = false

-----------------------------------------------------------------
-- Indentation
-----------------------------------------------------------------
bo.expandtab   = true
bo.shiftwidth  = 2
bo.softtabstop = 2
bo.tabstop     = 2
bo.autoindent  = true
bo.smartindent = true

-----------------------------------------------------------------
-- Folds
-----------------------------------------------------------------
wo.foldmethod = "manual"
wo.foldenable = false

-----------------------------------------------------------------
-- Search & path
-----------------------------------------------------------------
o.incsearch  = true
o.hlsearch   = true
o.ignorecase = true
o.smartcase  = true
o.path:append("**")

-----------------------------------------------------------------
-- Completion & wildmenu
-----------------------------------------------------------------
o.complete    = ".,w,b,u"
o.completeopt = "menuone,longest,preview"
o.shortmess:append("c")

o.wildmenu = true
o.wildmode = "list:full"
o.wildignore:append({
  "*.o","*.obj","*~","*vim/backups*","log/**","tmp/**",
  "*.png","*.jpg","*.gif","*.elf","*.lst","*.map",
  "*.a","*.pub","*.ilk","*.out","tags",
})

-----------------------------------------------------------------
-- Scrolling
-----------------------------------------------------------------
o.scrolloff     = 8
o.sidescrolloff = 15
o.sidescroll    = 1

-----------------------------------------------------------------
-- Colorscheme (always last)
-----------------------------------------------------------------
--g.gruvbox_contrast_dark = "hard"
--vim.cmd.colorscheme("gruvbox")
