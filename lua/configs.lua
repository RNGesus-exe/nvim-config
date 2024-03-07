-- Tab settings
vim.opt.expandtab = true --Converts tab into whitespace
vim.opt.shiftwidth = 4   --Makes tab amount 4 characters
vim.opt.softtabstop = 4  --When using backspace it deletes 4 characters space
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Line Wrap
vim.opt.wrap = false
vim.opt.fileencoding = "utf-8"

--Line Number
vim.wo.number = true

-- Error Sounds
vim.opt.errorbells = false

-- FINALLY NO MORE SWAPS
vim.opt.swapfile = false
vim.opt.backup = false
-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
