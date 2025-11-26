local g = vim.g

g.mapleader      = " "
g.maplocalleader = " "

-- Gruvbox hard dark with high contrast
vim.o.background = "dark"          -- force dark mode
vim.o.termguicolors = true         -- important for true colors

-- Force hard contrast
vim.g.gruvbox_contrast_dark = "hard"

-- Optional but recommended tweaks for even punchier contrast
vim.g.gruvbox_improved_strings   = 1
vim.g.gruvbox_improved_warnings  = 1
vim.g.gruvbox_italicize_comments = 1
vim.g.gruvbox_invert_selection   = 0

-- Set the colorscheme
vim.cmd([[colorscheme gruvbox]])

require("config")
require("plugins")
require("lsp")
