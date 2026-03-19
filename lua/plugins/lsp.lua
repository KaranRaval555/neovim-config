return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
    },
    { "mason-org/mason.nvim", opts = {}, cmd = { "Mason", "MasonInstall", "MasonUpdate" } },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },
    "saghen/blink.cmp", -- Added as dependency to ensure capabilities are ready
  },
  config = function()
    local function client_supports_method(client, method, bufnr)
      if vim.fn.has("nvim-0.11") == 1 then
        return client:supports_method(method, bufnr)
      end
      return client.supports_method(method, { bufnr = bufnr })
    end

    -- LSP Attach Logic (Mappings & Highlighting)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local map = function(keys, func, desc, mode)
          vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Mappings
        map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("gra", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
        map("grr", require("telescope.builtin").lsp_references, "References")
        map("gri", require("telescope.builtin").lsp_implementations, "Implementation")
        map("grd", require("telescope.builtin").lsp_definitions, "Definition")
        map("grD", vim.lsp.buf.declaration, "Declaration")
        map("gO", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
        map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
        map("grt", require("telescope.builtin").lsp_type_definitions, "Type Definition")

        -- Document Highlight
        if
          client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
        then
          local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd(
            { "CursorHold", "CursorHoldI" },
            { buffer = event.buf, group = highlight_group, callback = vim.lsp.buf.document_highlight }
          )
          vim.api.nvim_create_autocmd(
            { "CursorMoved", "CursorMovedI" },
            { buffer = event.buf, group = highlight_group, callback = vim.lsp.buf.clear_references }
          )
          vim.api.nvim_create_autocmd("LspDetach", {
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = event2.buf })
            end,
          })
        end

        -- Inlay Hints
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "Toggle Inlay Hints")
        end
      end,
    })

    -- Diagnostics Styling
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      },
      virtual_text = { source = "if_many", spacing = 2 },
    })

    -- Server Configurations
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local servers = {
      gopls = {},
      clojure_lsp = {},
      ts_ls = {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false -- Handled by Conform
        end,
      },
      emmet_ls = { filetypes = { "html", "typescriptreact", "javascriptreact", "css" } },
      lua_ls = {
        settings = { Lua = { completion = { callSnippet = "Replace" }, diagnostics = { globals = { "vim" } } } },
      },
      tinymist = { settings = { formatterMode = "typstyle" } },
    }

    local ensure_installed = vim.tbl_keys(servers)
    vim.list_extend(ensure_installed, { "stylua", "prettier" }) -- Add formatters here

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
        ["jdtls"] = function() end, -- Explicitly ignore jdtls (handled by nvim-jdtls)
      },
    })
  end,
}
