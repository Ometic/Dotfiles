--// Main \\--
local CMPNvimLSP = require("cmp_nvim_lsp")

local Api = vim.api

--// Core \\--
local PluginConfig = {}
PluginConfig["NoAutoSetup"] = true

function PluginConfig.Config(Plugin)
  local Servers = {
    ["nixd"] = {},
    ["lua_ls"] = {
      ["settings"] = {
        ["Lua"] = {
          ["diagnostics"] = {
            ["globals"]= { "vim" }
          },
          ["workspace"] = {
            ["library"] = Api.nvim_get_runtime_file("", true),
            ["checkThirdParty"] = false
          }
        }
      }
    }
  }

  for Server, Option in next, Servers do
    Option["on_attach"] = nil
    Option["capabilities"] = CMPNvimLSP.default_capabilities()

    Plugin[Server].setup(Option)
  end
end

return PluginConfig
