--// Imports \\--
local Command = vim.cmd

--// Core \\--
local PluginConfig = {}

PluginConfig["Options"] = {
  ["flavour"] = "mocha",
  ["transparent_background"] = true
}

function PluginConfig.Config()
  Command.colorscheme("catppuccin")
end

return PluginConfig
