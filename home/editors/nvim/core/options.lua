--// Imports \\--
local Option = vim.opt

--// Variables \\--
local Options = {
  --// General
  ["mouse"] = "a",
  ["clipboard"] = "unnamedplus",
  ["wrap"] = false,
  ["ignorecase"] = true,
  ["shortmess"] = "atI",
  ["completeopt"] = "menuone,noselect",
  ["undofile"] = true,
  ["updatetime"] = 250,
  
  --// Performance
  ["lazyredraw"] = true,
  ["shadafile"] = "NONE",

  --// Ui
  ["termguicolors"] = true,
  ["number"] = true,
  ["relativenumber"] = true,

  --// Indentation
  ["tabstop"] = 2,
  ["shiftwidth"] = 2,
  ["expandtab"] = true,
  ["autoindent"] = true,
  ["smartindent"] = true,
  ["breakindent"] = true,
}

--// Core \\--
for Key, Value in next, Options do
  Option[Key] = Value
end
