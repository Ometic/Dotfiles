--// Imports \\--
local Api = vim.api
local Lsp = vim.lsp

local NullLsBuiltins = require("null-ls")["builtins"]

--// Variables \\--
local AutoGroup = Api.nvim_create_augroup("LspFormatting", {})

--// Core \\--
local PluginConfig = {}

PluginConfig["Options"] = {
  ["sources"] = {
    NullLsBuiltins["formatting"]["stylua"]
  },
  ["on_attach"]= function (Client, Buffer)
    if Client.supports_method("textDocument/formatting") then
      Api.nvim_clear_autocmds({
        ["group"] = AutoGroup,
        ["buffer"] = Buffer
      })
      Api.nvim_create_autocmd("BufWritePre", {
        ["group"] = AutoGroup,
        ["buffer"] = Buffer,
        ["callback"] = function()
          Lsp.buf.format({
            ["filter"] = function(_Client)
              return _Client.name == "null-ls"
            end,
            ["bufnr"] = Buffer
          })
        end
      })
    end
  end
}

return PluginConfig
