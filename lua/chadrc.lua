---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "rosepine",
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.ui = {
    cmp = {
        lspkind_text = true,
        style = "default",
        format_colors = {
            lsp = true,
        },
    },
    telescope = { style = "bordered" },
    term = {
        base46_colors = true,
        winopts = { number = false },
        sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
        float = {
            relative = "editor",
            row = 0.3,
            col = 0.25,
            width = 0.5,
            height = 0.4,
            border = "single",
        },
    },
    lsp = { signature = true },
    cheatsheet = {
        theme = "grid",
        excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
    },
    mason = { pkgs = {}, skip = {} },

    colorify = {
        enabled = true,
        mode = "virtual",
        virt_text = "󱓻 ",
        highlight = { hex = true, lspvars = true },
    },
}

return M
