local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("i", "jk", "<ESC>")
map("n", "<leader>o", ":update<CR> :source<CR>", { desc = "Save and source current file" })
map("n", "<leader>w", "<cmd>update<CR>", { desc = "Save current file" })
map("n", "<leader>x", "<cmd>wq<CR>", { desc = "Quit current file" })
map("n", "<leader>yy", 'gg"+yG')
map("n", "<leader>dd", 'gg"+dG')
map("n", "<leader>vv", "ggVG")
map("n", "<leader>rr", 'ggVG"+p')
map("n", "<M-j>", "<cmd>cnext<CR>")
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "<M-k>", "<cmd>cprev<CR>")
map("n", "ss", ":split<Return>")
map("n", "sv", ":vsplit<Return>")
map("x", "J", ":move '>+1<CR>gv=gv", opts)
map("x", "K", ":move '<-2<CR>gv=gv", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-x>", function()
  vim.cmd("!chmod +x %")
end, { desc = "Make current file executable" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })
map("n", "<Down>", ":resize -2<CR>", opts)
map("n", "<Up>", ":resize +2<CR>", opts)
map("n", "<Left>", ":vertical resize -2<CR>", opts)
map("n", "<Right>", ":vertical resize +2<CR>", opts)

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

map("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.api.nvim_win_set_width(0, math.floor(vim.o.columns * 0.3))
end)
