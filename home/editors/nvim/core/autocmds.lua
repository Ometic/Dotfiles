--// Imports \\--
local Api = vim.api
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
for _, Cmd in next, Autocmds do
  local On = Cmd["on"]
  Cmd["on"] = nil

  Api.nvim_create_autocmd(On, Cmd)
end
