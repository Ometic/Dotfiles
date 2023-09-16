--// Imports \\--
local TelescopeBuiltin = require("telescope.builtin")
local TelescopeActions = require("telescope.actions")

local FileBrowser = require("telescope")["extensions"]["file_browser"]
local FileBrowserActions = FileBrowser["actions"]

--// Core \\--
local PluginConfig = {}

PluginConfig["Options"] = {
  ["defaults"] = {
    ["mappings"] = {
      ["n"] = {
        ["q"] = TelescopeActions.close
      }
    }
  },
  ["extensions"] = {
    ["file_browser"] = {
      ["theme"] = "dropdown",
      ["hijack_netrw"] = true,
      ["mappings"] = {
        ["n"] = {
          ["n"] = FileBrowserActions.create,
          ["b"] = FileBrowserActions.goto_parent_dir,
          ["<PageUp>"] = TelescopeActions.preview_scrolling_up,
          ["<PageDown>"] = TelescopeActions.preview_scrolling_down
        }
      }
    }
  }
}

PluginConfig["Mappings"] = {
  ["n"] = {
    ["<Leader>ff"] = { TelescopeBuiltin.find_files },
    ["<Leader>fg"] = { TelescopeBuiltin.live_grep },
    ["<Leader>sf"] = { 
      function()
        FileBrowser.file_browser({
          ["previewer"] = false,
          ["initial_mode"] = "normal",
          ["layout_config"] = {
            ["height"] = 40
          }
        })
      end
    }
  }  
}

function PluginConfig.Config(Plugin)
  Plugin.load_extension("file_browser")
end

return PluginConfig

