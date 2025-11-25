local g = vim.g
local map = vim.keymap.set

-- Easymotion configuration
g.EasyMotion_smartcase = 1        -- Ignore case unless you type uppercase
g.EasyMotion_use_smartsign_us = 1 -- Use smarter US layout signs
g.EasyMotion_startofline = 0      -- Keep cursor column when using JK motion


-- Optional: change the shading (the overlay dim)
g.EasyMotion_do_shade = 1

-- Key mappings (the classic ones)
map('n', 's',  '<Plug>(easymotion-s)',   { desc = 'EasyMotion search' })
map('o', 'z',  '<Plug>(easymotion-s)',   { desc = 'EasyMotion in operator-pending' })

-- Line motions
map({'n','v'}, '<Leader>j', '<Plug>(easymotion-j)', { desc = 'EasyMotion down lines' })
map({'n','v'}, '<Leader>k', '<Plug>(easymotion-k)', { desc = 'EasyMotion up lines' })
