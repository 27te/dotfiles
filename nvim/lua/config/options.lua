local o = vim.o
local g = vim.g

g.mapleader = " "

o.encoding = "utf-8"
o.fileencoding = "utf-8"

o.number = true
o.numberwidth = 1

o.title = true
o.autoindent = true
o.smartindent = true
o.hlsearch = true
o.backup = false
o.showcmd = true
o.cmdheight = 1
o.laststatus = 2
o.expandtab = true
o.scrolloff = 10
o.shell = "pwsh"
o.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
o.smarttab = true
o.breakindent = true
o.shiftwidth = 2
o.tabstop = 2
o.wrap = true -- No Wrap lines
