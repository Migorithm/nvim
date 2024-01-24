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
vim.keymap.set("n", "<leader><Up>", ":m .-2<CR>==") -- move line up(n)
vim.keymap.set("v", "<leader><Down>", ":m '>+1<CR>gv=gv") -- move line up(v)

vim.keymap.set("n", "<leader><Down>", ":m .+1<CR>==") -- move line down (n)
vim.keymap.set("v", "<leader><Up>", ":m '<-2<CR>gv=gv") -- move line down(v)



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

vim.keymap.set('n','<Esc>',"")

-- find and replace
vim.keymap.set("n","rr",":%s/")

-- copy to both clipboard
vim.keymap.set("v","bc","\"+y")


-- remove word when cursor is in the middle of word
vim.keymap.set("n","<s-d>","diw")

-- remove line before cursor 
vim.keymap.set("n","<leader>c<Left>","d^")


-- bracket
vim.keymap.set("i", "<", "<><Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "\"", "\"\"<Left>")


-- bracket
vim.keymap.set("i", "<", "<><Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "\"", "\"\"<Left>")
