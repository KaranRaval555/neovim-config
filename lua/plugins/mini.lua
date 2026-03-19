return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.statusline").setup()
    require("mini.pairs").setup()
  end,
}
