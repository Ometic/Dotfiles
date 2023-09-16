--// Imports \\--
local LuaSnip = require("luasnip")

local Function = vim.fn
local Api = vim.api

--// Core \\--
local PluginConfig = {}
PluginConfig["Plugin"] = require("cmp")

PluginConfig["Options"] = {
  ["snippet"] = {
    ["expand"] = function(Args)
      LuaSnip.lsp_expand(Args["body"])
    end
  },
  ["mapping"] = {
    ["<C-e>"] = PluginConfig["Plugin"]["mapping"].close(),
    ["<C-Space>"] = PluginConfig["Plugin"]["mapping"].complete(),
    ["<CR>"] = PluginConfig["Plugin"]["mapping"].confirm({
      ["behavior"] = PluginConfig["Plugin"]["ConfirmBehavior"]["Replace"],
      ["select"] = true
    }),
    ["<Tab>"] = PluginConfig["Plugin"].mapping(function(Fallback)
      local CMP = PluginConfig["Plugin"]

      if CMP.visible() then
        CMP.select_next_item()
      elseif LuaSnip.expand_or_jumpable() then
        Function.feedkeys(Api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        Fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = PluginConfig["Plugin"].mapping(function(Fallback)
      local CMP = PluginConfig["Plugin"]

      if CMP.visible() then
        CMP.select_prev_item()
      elseif LuaSnip.jumpable(-1) then
        Function.feedkeys(Api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        Fallback()
      end
    end, { "i", "s" })
  },
  ["sources"] = {
    { ["name"] = "nvim_lsp" },
    { ["name"] = "luasnip" },
    { ["name"] = "buffer" },
    { ["name"] = "path" }
  }
}

return PluginConfig
