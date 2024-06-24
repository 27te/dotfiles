require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.number = true
o.relativenumber = true
o.autoindent = true
o.smartindent = true
o.backup = false
o.scrolloff = 10
o.laststatus = 3
o.shell = "pwsh"
o.smarttab = true
o.breakindent = true
o.tabstop = 2
o.wrap = true
-- o.wildignore:append({"*/node_modules/*"})
