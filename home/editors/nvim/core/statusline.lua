--// Imports \\--
local Api = vim.api

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

function Statusline.GetStatusLine()
  local Modules = {
    Statusline.Mode()
  }

  return table.concat(Modules)
end

return Statusline
