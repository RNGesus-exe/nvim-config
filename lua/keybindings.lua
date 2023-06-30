--Keymaps
local keymap = vim.api.nvim_set_keymap
keymap('n','<c-s>',':w<CR>',{})         --Keymap to write to file in normal mode
keymap('i','<c-s>','<Esc>:w<CR>',{})   --Keymap to exit insert mode and save file and enter normal mode
local opts = { noremap = true }
keymap('n','<c-j>','<c-w>j',opts)       --Keymap to move to bottom split window
keymap('n','<c-h>','<c-w>h',opts)       --Keymap to move to left split window
keymap('n','<c-k>','<c-w>k',opts)       --Keymap to move to above split window
keymap('n','<c-l>','<c-w>l',opts)       --Keymap to move to right split window
