return {
  "tjdevries/colorbuddy.nvim",
  name = "colorbuddy",
  priority = 1000,
  lazy = false,
  config = function()
    require("colors.punk") -- this will define all your Color.new entries
    require("colorbuddy").colorscheme() -- apply palette
  end,
}
