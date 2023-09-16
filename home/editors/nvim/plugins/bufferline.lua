--// Imports \\--
local CatppuccinBufferline = require("catppuccin.groups.integrations.bufferline")

--// Core \\--
local PluginConfig = {}

PluginConfig["Options"] = {
  ["options"] = {
    ["show_buffer_close_icons"] = false,
    ["show_close_icon"] = false,
    ["color_icons"] = true,
    ["always_show_bufferline"] = false
  },
  ["highlights"] = CatppuccinBufferline.get() 
}

PluginConfig["Mappings"] = {
  ["n"] = {
    ["<Tab>"] = { "<Cmd> BufferLineCycleNext <CR>" },
    ["<S-Tab>"] = { "<Cmd> BufferLineCyclePrev <CR>" },
    ["<Leader>x"] = { "<Cmd> bdelete <CR>" },
    ["<Leader>X"] = { "<Cmd> bdelete! <CR>" }
  }
}

return PluginConfig
