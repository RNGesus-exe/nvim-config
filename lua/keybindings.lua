function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

--Save file
Map('n','<c-s>',':w<CR>',{})
Map('i','<c-s>','<Esc>:w<CR>',{})

-- Window Movement
Map('n','<c-Down>','<c-w>j')       --Keymap to move to bottom split window
Map('n','<c-Left>','<c-w>h')       --Keymap to move to left split window
Map('n','<c-Up>','<c-w>k')       --Keymap to move to above split window
Map('n','<c-Right>','<c-w>l')       --Keymap to move to right split window

-- Terminal Movement
Map("t", "<C-Left>", "<cmd>wincmd h<CR>")
Map("t", "<C-Down>", "<cmd>wincmd j<CR>")
Map("t", "<C-Up>", "<cmd>wincmd k<CR>")
Map("t", "<C-Right>", "<cmd>wincmd l<CR>")

-- Resize Window
Map("n", "<C-k>", ":resize -2<CR>")
Map("n", "<C-j>", ":resize +2<CR>")
Map("n", "<C-h>", ":vertical resize -2<CR>")
Map("n", "<C-l>", ":vertical resize +2<CR>")

-- Resize Terminal
Map("t", "<C-k>", "<cmd>resize -2<CR>")
Map("t", "<C-j>", "<cmd>resize +2<CR>")
Map("t", "<C-h>", "<cmd>vertical resize -2<CR>")
Map("t", "<C-l>", "<cmd>vertical resize +2<CR>")

-- Move Block of Text
Map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
Map("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- Indentation
Map("v", "<", "<gv")
Map("v", ">", ">gv")
