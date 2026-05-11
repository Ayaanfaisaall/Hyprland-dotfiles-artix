require "nvchad.mappings"

-- add yours here
vim.api.nvim_create_user_command('Hterm', function()
  require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, {})

vim.api.nvim_create_user_command('Vterm', function()
  require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, {})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Normal mode mappings for navigation
map("n", "fs", "gg0", { desc = "Go to first line" })
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

-- Open Terminal
map("n", ",ht", "<cmd> Hterm <CR>", { desc = "Horizontal terminal toggle" })
map("n", ",vt", "<cmd> Vterm <CR>", { desc = "Vertical terminal toggle" })

-- Terminal Normal Mode
map("t", ",n", [[<C-\><C-n>]], {desc = "Terminal Normal Mode"})

-- Normal Mode Window Navigation
map("t", ",k", [[<C-\><C-n><C-w>k]], { desc = "Move to window above" })
map("n", ",k", [[<C-\><C-n><C-w>k]], { desc = "Move to window above" })
map("t", ",j", [[<C-\><C-n><C-w>j]], { desc = "Move to window below" })
map("n", ",j", [[<C-\><C-n><C-w>j]], { desc = "Move to window below" })
map("t", ",h", [[<C-\><C-n><C-w>h]], { desc = "Move to window left" })
map("n", ",h", [[<C-\><C-n><C-w>h]], { desc = "Move to window left" })
map("t", ",l", [[<C-\><C-n><C-w>l]], { desc = "Move to window right" })
map("n", ",l", [[<C-\><C-n><C-w>l]], { desc = "Move to window right" })

