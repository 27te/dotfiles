require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ",", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "zz", ":q!<cr>")
map("n", "zw", ":wq<cr>")
map({ "n", "i", "v" }, "<C-a>", "gg<S-v>G")
map("n", "te", ":tabedit")
map("n", "1", ":tabprev<Return>")
map("n", "2", ":tabnext<Return>")
