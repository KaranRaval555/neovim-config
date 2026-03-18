return {
  "nvim-telescope/telescope.nvim",

  cmd = "Telescope",

  keys = {
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "[S]earch [H]elp",
    },
    {
      "<leader>fm",
      function()
        require("telescope.builtin").man_pages()
      end,
      desc = "[S]earch man pages",
    },
    {
      "<leader>fk",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "[S]earch [K]eymaps",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").builtin()
      end,
      desc = "[S]earch [S]elect Telescope",
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "[S]earch current [W]ord",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "[S]earch by [G]rep",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "[S]earch [D]iagnostics",
    },
    {
      "<leader>f.",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Recent Files",
    },
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },

    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
          winblend = 10,
          previewer = false,
        }))
      end,
      desc = "Fuzzy search current buffer",
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },

  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_ivy(),
        },
        fzf = {},
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
  end,
}
