local map = vim.keymap.set
local silent = { silent = true }

-- Save with <leader><space>  (i.e. double-tap space)
map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save buffer" })

-- ╭──────────────────────────────────────────────────────────╮
-- │  Insert mode escapes & shortcuts                         │
-- ╰──────────────────────────────────────────────────────────╯
map("i", "jk", "<Esc>", silent)
map("i", "kj", "<Esc>", silent)

-- ╭──────────────────────────────────────────────────────────╮
-- │  Terminal mode                                           │
-- ╰──────────────────────────────────────────────────────────╯
map("t", "<Esc>",      "<C-\\><C-n>", silent)
map("t", "<C-h>",      "<C-\\><C-n><C-w>h", silent)
map("t", "<C-j>",      "<C-\\><C-n><C-w>j", silent)
map("t", "<C-k>",      "<C-\\><C-n><C-w>k", silent)
map("t", "<C-l>",      "<C-\\><C-n><C-w>l", silent)

-- Paste register in terminal (exact same behaviour as your old mapping)
map("t", "<expr> <C-R>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']])

-- ╭──────────────────────────────────────────────────────────╮
-- │  Window navigation & resizing                            │
-- ╰──────────────────────────────────────────────────────────╯
map({"n", "t"}, "<C-h>", "<Cmd>wincmd h<CR>", silent)
map({"n", "t"}, "<C-j>", "<Cmd>wincmd j<CR>", silent)
map({"n", "t"}, "<C-k>", "<Cmd>wincmd k<CR>", silent)
map({"n", "t"}, "<C-l>", "<Cmd>wincmd l<CR>", silent)

map("n", "<C-Left>",  "<C-w><", silent)
map("n", "<C-Right>", "<C-w>>", silent)
map("n", "<C-Up>",    "<C-w>+", silent)
map("n", "<C-Down>",  "<C-w>-", silent)

map("n", "<C-w>m", "<C-w>_<C-w>|", silent)   -- maximize current split

-- ╭──────────────────────────────────────────────────────────╮
-- │  Buffer / tab navigation                                 │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<C-Tab>",   "<Cmd>bnext<CR>", silent)
map("n", "<S-Tab>",   "<Cmd>bprevious<CR>", silent)   -- Ctrl-Shift-Tab

-- Close current buffer and go back to alternate (your <leader>d)
map("n", "<leader>d", "<Cmd>b#<CR><Cmd>bdelete! #<CR><Cmd>bn<CR><Cmd>bp<CR>", silent)

-- ╭──────────────────────────────────────────────────────────╮
-- │  Saving & sessions                                       │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<leader>w", "<Cmd>w<CR>", silent)
map("n", "<F8>", "<Cmd>mksession! .\\_vim_session<CR>", silent)
map("n", "<F9>", "<Cmd>source .\\_vim_session<CR>", silent)

-- ╭──────────────────────────────────────────────────────────╮
-- │  Clipboard / yank                                        │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<leader>yt", '"+y', { desc = "Yank to system clipboard (motion)" })
map("x", "<leader>yt", '"+y', { desc = "Yank selection to clipboard" })

map("n", "<leader>ya", 'ggVG"+y', { desc = "Yank entire buffer to clipboard" })
map("n", "<leader>yo", 'ggVG"+y:q!<CR>', { desc = "Yank all + force quit" })

-- Paste from OS clipboard below current line in normal mode
map("n", "<C-p>", ":set paste<CR>o<C-r>+<Esc>:set nopaste<CR>", silent)

-- Inner paste: replace word under cursor with clipboard ("0 register)
map("n", "<leader>ip", 'ciw<C-r>0<Esc>', { desc = "Replace word with yank register" })

-- ╭──────────────────────────────────────────────────────────╮
-- │  Search & quickfix                                       │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<F4>", ":vimgrep /<C-r><C-w>/j **/*<CR>", silent)
map("n", "<F5>", "*N:vimgrep /<C-r><C-w>/j %<CR>", silent)
map("n", "<F6>", "<Cmd>copen<CR>", silent)
map("n", "<C-n>", "<Cmd>cnext<CR>", silent)
map("n", "<C-b>", "<Cmd>cprevious<CR>", silent)

map("n", "*", [[/\<<C-r><C-w>\><CR>N]], silent)   -- highlight word without jumping
map("n", "<C-_>", "<Cmd>nohlsearch<CR>", silent) -- Ctrl-/

-- ╭──────────────────────────────────────────────────────────╮
-- │  Netrw (file explorer)                                   │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<leader>ee", "<Cmd>Explore<CR>", silent)
map("n", "<leader>ev", "<Cmd>Vexplore<CR>", silent)
map("n", "<leader>es", "<Cmd>Sexplore<CR>", silent)

-- ╭──────────────────────────────────────────────────────────╮
-- │  Tags & code navigation                                  │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<C-\\>", "<C-t>", silent)                     -- jump back from tag
map("n", "<C-w>v]", "<C-w>v<C-w>l<C-]>", silent)       -- vertical split right
map("n", "<C-w>v[", "<C-w>v<C-]>", silent)             -- vertical split left
map("n", "<C-w>h]", "<C-w>s<C-w>j<C-]>", silent)       -- horizontal below
map("n", "<C-w>h[", "<C-w>s<C-]>", silent)             -- horizontal above

map("n", "<leader>[", '"tyiw', { desc = "Grab word into t register" })
map("n", "<leader>]", "<Cmd>execute \"tag \" . getreg(\"t\")<CR>", { desc = "Jump to tag in t register" })

-- ╭──────────────────────────────────────────────────────────╮
-- │  Misc utilities                                          │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<leader>rl", [[:%s/\(\<<C-r><C-w>\>\)//gc<Left><Left><Left>]], { desc = "Rename word under cursor" })


-- EasyMotion
map("n", "s",  "<Plug>(easymotion-s)")
map({"n","x","o"}, "<leader>", "<Plug>(easymotion-prefix)")

