return { -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  "folke/tokyonight.nvim",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require("tokyonight").setup({
      styles = {
        comments = { italic = false },
      },
    })
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
