--// Imports \\--
local Api = vim.api
local Function = vim.fn

--// Core \\--
local Statusline = {}

Statusline["Modes"] = {
  ["n"] = { "NORMAL", "Blue" },
  ["no"] = { "NORMAL", "Blue" },
  ["nov"] = { "NORMAL", "Blue" },
  ["noV"] = { "NORMAL", "Blue" },
  ["niI"] = { "NORMAL", "Blue" },
  ["niR"] = { "NORMAL", "Blue" },
  ["niV"] = { "NORMAL", "Blue" },
  ["noCTRL-V"] = { "NORMAL", "Blue" },

  ["i"] = { "INSERT", "Magenta" },
  ["ic"] = { "INSERT", "Magenta" },
  ["ix"] = { "INSERT", "Magenta" },

  ["v"] = { "VISUAL", "Cyan" },
  ["V"] = { "V-LINE", "Cyan" },
  ["vs"] = { "V-CHAR", "Cyan" },
  ["Vs"] = { "V-LINE", "Cyan" },
  [""] = { "V-BLOCK", "Cyan" },

  ["R"] = { "Replace", "Orange" },
  ["Rc"] = { "Replace", "Orange" },
  ["Rx"] = { "Replace", "Orange" },
  ["Rv"] = { "V-Replace", "Orange" },
  ["Rvc"] = { "V-Replace", "Orange" },
  ["Rvx"] = { "V-Replace", "Orange" },

  ["s"] = { "SELECT", "Blue" },
  ["S"] = { "S-LINE", "Blue" },
  [""] = { "S_BLOCK", "Blue" },

  ["c"] = { "COMMAND", "Green" },
  ["cv"] = { "COMMAND", "Green" },
  ["ce"] = { "COMMAND", "Green" },

  ["r"] = { "CONFIRM", "Teal" },
  ["rm"] = { "CONFIRM", "Teal" },
  ["r?"] = { "CONFIRM", "Teal" },
  ["x"] = { "CONFIRM", "Teal" },

  ["!"] = { "SHELL", "Yellow" },
  ["t"] = { "TERMINAL", "Yellow" },
}

function Statusline.GetHighlight(Highlight)
  Highlight = "Sl_" .. Highlight

  return "%#" .. Highlight .. "#"
end

function Statusline.CreateBlock(Icon, Text, Highlight)
  local LSep = ""
  local RSep = ""

  Text = " " .. Text

  local Block = {
    Statusline.GetHighlight(Highlight .. "LSep"), LSep,
    Statusline.GetHighlight(Highlight .. "Icon"), Icon, " ",
    Statusline.GetHighlight(Highlight .. "Text"), Text, " ",
    Statusline.GetHighlight(Highlight .. "RSep"), RSep
  }

  return table.concat(Block)
end

function Statusline.Mode()
  local CurrentMode = Api.nvim_get_mode()["mode"]
  local Mode = Statusline["Modes"][CurrentMode]

  return Statusline.CreateBlock("", Mode[1], Mode[2])
end

function Statusline.File()
  local Icon = "󰈚"
  local Filename = (Function.expand("%") == "") and "No File" or Function.expand("%:t")

  if Filename ~= "No File" then
    local DevIcon = require("nvim-web-devicons")

    local _Icon = DevIcon.get_icon(Filename)
    if _Icon then Icon = _Icon end
  end

  return Statusline.CreateBlock(Icon, Filename, "Red")
end

function Statusline.CWD()
  local DirectoryName = Function.fnamemodify(Function.getcwd(), ":t")

  return Statusline.CreateBlock("󰉋", DirectoryName, "Green")
end

function Statusline.Cursor()
  local StartLine = 1
  local TotalLine = Function.line("$")
  local CurrentLine = Function.line(".") 

  local Persent = math.modf((CurrentLine / TotalLine) * 100)
  local Text = Persent .. tostring("%%")

  Text = (CurrentLine == StartLine and "Top") or Text
  Text = (CurrentLine == TotalLine and "Bot") or Text

  return Statusline.CreateBlock("", Text, "Yellow")
end

function Statusline.GetStatusLine()
  local Modules = {
    Statusline.Mode(),
    Statusline.File(),

    "%=",
    "",
    "%=",

    Statusline.CWD(),
    Statusline.Cursor()
  }

  return table.concat(Modules)
end

return Statusline
