--// Imports \\--
local Command = vim.cmd

--// Core \\--
local PluginConfig = {}

PluginConfig["Options"] = {
  ["flavour"] = "mocha",
  ["transparent_background"] = true,
  ["custom_highlights"] = function(Colors)
    local Highlight = {}

    local function GenerateStatuslineHL(Name, Color)
      Highlight["Sl_" .. Name .. "LSep"] = { 
        ["fg"] = Colors[Color],
        ["bold"] = true,
      }

      Highlight["Sl_" .. Name .. "Icon"] = { 
        ["fg"] = Colors["base"],
        ["bg"] = Colors[Color],
        ["bold"] = true,
      }

      Highlight["Sl_" .. Name .. "Text"] = { 
        ["fg"] = Colors[Color],
        ["bg"] = Colors["base"],
        ["bold"] = true,
      }

      Highlight["Sl_" .. Name .. "RSep"] = { 
        ["fg"] = Colors["base"],
        ["bold"] = true,
      }
    end

    GenerateStatuslineHL("Blue", "blue")
    GenerateStatuslineHL("Magenta", "mauve")
    GenerateStatuslineHL("Cyan", "sky")
    GenerateStatuslineHL("Orange", "peach")
    GenerateStatuslineHL("Red", "red")
    GenerateStatuslineHL("Green", "green")
    GenerateStatuslineHL("Yellow", "yellow")
    GenerateStatuslineHL("Teal", "teal")

    return Highlight
  end
}

function PluginConfig.Config()
  Command.colorscheme("catppuccin")
end

return PluginConfig
