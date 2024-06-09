local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- exit to nvim
map("n", "zz", ":q!<cr>", opts)
map("n", "zw", ":wq!<cr>", opts)

-- select all
map("n", "<C-a>", "gg<S-v>G")

-- new tab
map("n", "te", ":tabedit")
map("n", "1", ":tabnext<Return>", opts)
map("n", "2", ":tabnext<Return>", opts)

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)

-- Move window
map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")
