--// Core \\--
local PluginConfig = {}

PluginConfig["Options"] = {
  ["ensure_installed"] = { "lua" },
  ["auto_install"] = false,
  ["highlight"] = {
    ["enable"] = true,
    ["additional_vim_regex_highlighting"] = false
  }
}

return PluginConfig
