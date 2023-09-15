--// Imports \\--
local Command = vim.cmd

--// Core \\--
local PluginConfig = {}

function PluginConfig.Config()
  Command.colorscheme("catppuccin")
end

return PluginConfig
