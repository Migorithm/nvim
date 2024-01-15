vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.swapfile = false

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')







-- select word
vim.keymap.set("n", "<c-d>", "viw")

-- line change
vim.keymap.set("x", "<c-k>", ":move '<-2<cr>gv-gv") -- up
vim.keymap.set("x", "<c-j>", ":move '>+1<cr>gv-gv") -- down


-- fold expr
vim.keymap.set("n", "<c-c>", "zc") 

-- find ( /word )
-- terminal
vim.keymap.set("c" ,"ft" , "FloatermNew --name=mifl --height=0.8 --width=0.7 --autoclose=2 ")


-- save on the spot
vim.keymap.set("n" ,"<c-s>" , ":w <CR>")
vim.keymap.set('i' ,"<c-s>", "<ESC>:w<CR>")


-- go to previously opened file
vim.keymap.set("n","<c-[>","<c-6>")


-- go to error, warning and so on
vim.keymap.set("n", "ee", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)






