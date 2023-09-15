--// Imports \\--
local Global = vim.g

--// Variables \\--
local Maps = {
  ["n"] = {
    ["x"] = { '"_x' },
    ["<Esc>"] = { "<Cmd> noh <CR>" },
    ["<C-a>"] = { "gg<S-v>G" },

    --// Split Window
    ["<Leader>s"] = { "<Cmd> split <CR>" },
    ["<Leader>v"] = { "<Cmd> vsplit <CR>" },
    ["<C-h>"] = { "<C-w>h" },
    ["<C-j>"] = { "<C-w>j" },
    ["<C-k>"] = { "<C-w>k" },
    ["<C-l>"] = { "<C-w>l" },

    --// Buffer
    ["<Leader>t"] = { "<Cmd> enew <CR>" },
  }
}

--// Core \\--
Global["mapleader"] = " "

Utils.LoadMappings(Maps)
