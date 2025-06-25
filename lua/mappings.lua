require "nvchad.mappings"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('n', '<Esc>', '<cmd>nohlsearch<CR>') --clears highlighting in the normal mode
map('n', '<leader>yy', 'gg"+yG')
map('n', '<leader>dd', 'gg"+dG')
map("n", "<M-j>", "<cmd>cnext<CR>")
map("n", "<M-k>", "<cmd>cprev<Cb>")
map("n", "ss", ":split<Return>")
map("n", "sv", ":vsplit<Return>")
