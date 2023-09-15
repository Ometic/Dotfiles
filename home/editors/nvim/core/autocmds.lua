--// Imports \\--
local Option = vim.opt

--// Variables \\--
local Autocmds = {
  {
    ["on"] = "BufEnter",
    ["desc"] = "Disable New Line Comment",
    ["callback"] = function()
      Option["formatoptions"]:remove({ "c", "r", "o" })
    end
  }
}

--// Core \\--
Utils.LoadAutocmds(Autocmds)
