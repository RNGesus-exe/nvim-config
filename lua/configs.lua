-- Tab settings
vim.opt.expandtab = true --Converts tab into whitespace
vim.opt.shiftwidth = 4   --Makes tab amount 4 characters
vim.opt.softtabstop = 4  --When using backspace it deletes 4 characters space

-- Line Wrap
vim.opt.wrap = false
vim.opt.fileencoding = "utf-8"

--Line Number
vim.wo.number = true

-- Color Scheme
vim.cmd [[colorscheme molokai]]
