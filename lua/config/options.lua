local o = vim.o
vim.g.have_nerd_font = true
o.shiftwidth = 4
o.background = "dark"
o.matchtime = 2
o.autoindent = true
o.wrap = true
o.history = 100
o.swapfile = false
o.shiftround = true
o.number = true
o.relativenumber = true
o.numberwidth = 4
o.mouse = "a"
o.showmode = false
o.showcmd = false
o.laststatus = 3
o.autowrite = true
o.autoread = true
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
o.breakindent = true
o.smartindent = true
o.smarttab = true
o.cindent = true
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.undofile = true
o.termguicolors = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.updatetime = 250
o.timeoutlen = 300
o.title = true
o.splitright = true
o.splitbelow = true
o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
o.inccommand = "split"
o.cursorline = true
o.ttyfast = true
o.smoothscroll = true
o.hlsearch = true
o.completeopt = "menu", "menuone", "noselect"
o.cursorlineopt = "both"
o.scrolloff = 10
o.confirm = true

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
