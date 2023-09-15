--// Imports \\--
local Api = vim.api
local Keymap = vim.keymap
local Option = vim.option

--// Core \\--
local Utils = {}

function Utils.LoadAutocmds(Cmds)
  for _, Cmd in next, Cmds do
    local On = Cmd["on"]
    Cmd["on"] = nil
    Api.nvim_create_autocmd(On, Cmd)
  end
end

function Utils.LoadMappings(Maps)
  for Mode, Value in next, Maps do
    for Key, Map in next, Value do
      local Command = Map[1]
      Map[1] = nil
      Keymap.set(Mode, Key, Command, Map)
    end
  end
end

function Utils.LoadOptions(Options)
  for Key, Value in next, Options do
    Option[Key] = Value
  end
end

function Utils.LoadPlugin(Name)
  local Success, PluginConfig = pcall(require, "plugins." .. Name)
  if not Success or type(PluginConfig) ~= "table" then
    error("Failed to load plugin config: " .. Name .. " (PLUGIN_CONFIG_NOT_FOUND)")
  end

  local Success, Plugin = pcall(require, Name)
  if not Success or type(Plugin) ~= "table" then
    error("Failed to load plugin: " .. Name .. " (PLUGIN_NOT_FOUND)")
  end

  PluginConfig["Options"] = PluginConfig["Options"] or {}
  PluginConfig["NOptions"] = PluginConfig["NOptions"] or {}
  PluginConfig["Autocmds"] = PluginConfig["Autocmds"] or {}
  PluginConfig["Mappings"] = PluginConfig["Mappings"] or {}


  Plugin.setup(PluginConfig["Options"])
  
  Utils.LoadOptions(PluginConfig["NOptions"])
  Utils.LoadAutocmds(PluginConfig["Autocmds"])
  Utils.LoadMappings(PluginConfig["Mappings"])

  PluginConfig.Config()
end

return Utils
