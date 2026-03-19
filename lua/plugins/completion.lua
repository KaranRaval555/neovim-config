return {
  "saghen/blink.cmp",
  version = "*",
  event = "InsertEnter",

  opts = {
    keymap = {
      ["<Tab>"] = { "accept", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    completion = {
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" }, auto_show = false, auto_show_delay_ms = 500 },
    },

    fuzzy = { implementation = "lua" },

    signature = { enabled = true },
  },
}
