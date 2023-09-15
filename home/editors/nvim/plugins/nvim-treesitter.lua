--// Core \\--
local PluginConfig = {}
PluginConfig["Plugin"] = require("nvim-treesitter.configs")

PluginConfig["Options"] = {
  ["ensure_installed"] = {},
  ["auto_install"] = false,
  ["highlight"] = {
    ["enable"] = true,
    ["additional_vim_regex_highlighting"] = false
  }
}

return PluginConfig
