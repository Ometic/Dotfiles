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
  ["smarttab"] = true,
  ["expandtab"] = true,
  ["autoindent"] = true,
  ["breakindent"] = true,
  ["smartindent"] = true,
  ["scrolloff"] = 10
}

--// Core \\--
Utils.LoadOptions(Options)
