return {
  "mattn/emmet-vim",
  ft = { "html", "typescriptreact", "javascriptreact" },
  config = function()
    vim.g.user_emmet_settings = {
      typescriptreact = { "html" },
      javascriptreact = { "html" },
    }
  end,
}
