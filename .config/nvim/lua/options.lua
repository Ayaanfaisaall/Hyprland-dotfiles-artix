vim.g.mapleader = ","
vim.g.maplocalleader = ","

require "nvchad.options"

-- add yours here!
local o = vim.o

o.number = true
o.mouse = "a"
-- syntax on likhne ki zaroorat nahi, NvChad ka nvim-treesitter isko automatically aur behtar handle karta hai.
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
