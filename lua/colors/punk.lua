local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

-- Cyberpunk

-- main bg
Color.new("PortGore", "#1e1e3e")
Color.new("Mirage", "#1a202d")
Color.new("teal", "#007f80")
Color.new("persian_green", "#00b3a1")
Color.new("orient", "#005b80")
Color.new("midnight", "#001f3d")
Color.new("fiord", "#3a4a69")
Color.new("smalt_blue", "#5a7c90")
Color.new("sinbad", "#9dc1d8")
Color.new("WhiteAce", "#e0f7fa")
Color.new("EastBay", "#393979")
Color.new("Scampi", "#6b6bb3")
Color.new("RegentStBlue", "#a9c2e0")
Color.new("WildStrawberry", "#ff3d94")
Color.new("MediumRedViolet", "#b5307e")
Color.new("DaisyBush", "#6a2a98")
Color.new("Meteorite", "#3f1c6d")
Color.new("VioletDark", "#210b4b")
Color.new("LuckyPoint", "#1f1b79")
Color.new("Victoria", "#4a3d8a")
Color.new("Wisteria1", "#995fb4")
Color.new("Cerise", "#d63d9e")
Color.new("Bittersweet", "#ff6e61")

Color.new("PortGore2", "#201b3b")
Color.new("Gigas", "#493c90")
Color.new("FuchsiaBlue", "#7d4ebc")
Color.new("Wisteria2", "#a858b6")
Color.new("Cranberry", "#d55d8b")

Color.new("white", "#f2e5bc")
Color.new("red", "#cc6666")
-- Color.new("pink", "#fef601")
Color.new("green", "#99cc99")
Color.new("yellow", "#ebc6ff")
Color.new("blue", "#81a2be")
Color.new("aqua", "#8ec07c")
Color.new("cyan", "#8abeb7")
Color.new("purple", "#8e6fbd")
Color.new("VioletLight", "#b294bb")
Color.new("orange", "#de935f")
Color.new("brown", "#a3685a")

Color.new("seagreen", "#698b69")

require("colorbuddy").colorscheme()
Color.new("DarkBg", "#111111")

local bg = c.DarkBg
local fg = c.RegentStBlue

local background_string = "#111111"
Color.new("background", background_string)

Color.new("Charcoal", "#191724") -- deep, muted purple-black
Color.new("Grape", "#1f1d2e") -- dark violet-gray
Color.new("Plum", "#26233a") -- desaturated dark plum
Color.new("LavenderGray", "#6e6a86") -- soft grayish lavender
Color.new("Heather", "#908caa") -- pale lavender-gray
Color.new("Ivory", "#e0def4") -- light ivory-white
Color.new("Rose", "#eb6f92") -- rosy pink
Color.new("Amber", "#f6c177") -- warm golden yellow
Color.new("Peach", "#ebbcba") -- soft peachy pink
Color.new("Teal", "#31748f") -- pine-teal blue
Color.new("Sky", "#9ccfd8") -- light sky blue
Color.new("Lilac", "#c4a7e7") -- gentle purple-lilac
Color.new("ShadowLow", "#21202e") -- shadowy dark purple
Color.new("ShadowMed", "#403d52") -- mid-depth muted violet
Color.new("ShadowHigh", "#524f67") -- slightly lighter purple-gray
Color.new("LavenderGray", "#9C8FBD")
Color.new("ShadowHigher", "#9C8FBD")
Color.new("GrayBlue", "#90A4AE") -- gray-blue (neutral)
Color.new("SoftRed", "#E57373") -- soft red

Color.new("Pink", "#F06292") -- pink
Color.new("TagHTML", "#F06292") -- pink
Color.new("Orange", "#FF8A65") -- orange

Group.new("@type.builtin", c.Teal, nil, s.none)
Group.new("@function", c.persian_green, nil, s.none)
Group.new("@punctuation.bracket", c.LavenderGray, nil, s.none)
Group.new("@keyword", c.blue, nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
Group.new("@property", c.blue)
Group.new("@variable", c.LavenderGray, nil)
Group.new("@tag.delimiter.tsx", c.LavenderGray, nil)
Group.new("@tag", c.TagHTML, nil)
Group.new("@tag.attribute.html", c.Teal, nil)
Group.new("@tag.attribute.tsx", c.Teal, nil)
Group.new("@tag.builtin.tsx", c.TagHTML, nil)
Group.new("@type", c.Sky, nil)
Group.new("@comment", c.ShadowHigh, nil)
Group.new("@variable.builtin", c.purple:light():light(), g.Normal)

vim.api.nvim_set_hl(0, "LineNr", { fg = "#524f67", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff6e61", bg = "NONE" })
