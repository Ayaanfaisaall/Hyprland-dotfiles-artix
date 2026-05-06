require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Normal mode mappings for navigation
map("n", "fs", "gg", { desc = "Go to first line" })
map("n", "fe", "G", { desc = "Go to last line" })
map("n", "end", "$", { desc = "Go to end of line" })
map("n", "dt", "dd", { desc = "Delete line" })
map("n", "dne", "0", { desc = "Go to absolute start of line" })
map("n", "dnw", "^", { desc = "Go to first non-blank character" })

-- Operator-pending mappings 
map("o", "fs", "gg", { desc = "Operate to first line" })
map("o", "fe", "G", { desc = "Operate to last line" })
map("o", "end", "$", { desc = "Operate to end of line" })
map("o", "dtt", "dd", { desc = "Operate delete line" })
map("o", "dne", "0", { desc = "Operate to absolute start of line" })
map("o", "dnw", "^", { desc = "Operate to first non-blank char" })

-- System clipboard copy (combined normal and visual mode for 'cp')
map({ "n", "v" }, "cp", '"+y', { desc = "Copy to system clipboard" })
map("n", "cpa", 'gg"+yG', { desc = "Copy all to system clipboard" })
map("n", "dta", "ggdG", { desc = "Delete all" })

-- Commenting / Uncommenting mappings
map("n", "cmt", "I# <Esc>", { desc = "Comment line" })
map("n", "cmr", "^xx", { desc = "Uncomment line" })
map("v", "cmt", ":s/^/# /<CR>", { desc = "Comment selection" })
map("v", "cmr", "^xx", { desc = "Uncomment selection" })
