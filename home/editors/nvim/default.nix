{ pkgs, ... }:

let
  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins(lang: [
    lang.nix
    lang.lua
  ]);

  catppuccin = pkgs.vimUtils.buildVimPlugin {
      name = "catppuccin";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "nvim";
        rev = "85e93601e0f0b48aa2c6bbfae4d0e9d7a1898280";
        sha256 = "sha256-86tK098391f4XhJ9JbD03jrqnTmMSIU566SeQPqArzE=";
      };
  };
in {
  home.file.".config/nvim/lua/core".source = ./core;
  home.file.".config/nvim/lua/plugins".source = ./plugins;

  home.packages = with pkgs; [
    # Lua
    lua-language-server stylua

    # Telescope
    ripgrep
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    defaultEditor = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      plenary-nvim

      # Eye Candy
      {
        plugin = catppuccin;
        config = ''Utils.LoadPlugin("catppuccin")'';
        type = "lua";
      }
      {
        plugin = bufferline-nvim;
        config = ''Utils.LoadPlugin("bufferline")'';
        type = "lua";
      }
      {
        plugin = treesitter;
        config = ''Utils.LoadPlugin("nvim-treesitter")'';
        type = "lua";
      }
      {
        plugin = nvim-web-devicons;
        config = ''Utils.LoadPlugin("nvim-web-devicons")'';
        type = "lua";
      }

      # Telescope
      {
        plugin = telescope-nvim;
        config = ''Utils.LoadPlugin("telescope")'';
        type = "lua";
      }
      { plugin = telescope-file-browser-nvim; }

      # Lsp
      {
        plugin = nvim-lspconfig;
        config = ''Utils.LoadPlugin("lspconfig")'';
        type = "lua";
      }
      {
        plugin = null-ls-nvim;
        config = ''Utils.LoadPlugin("null-ls")'';
        type = "lua";
      }
      {
        plugin = luasnip;
        type = "lua";
      }
      {
        plugin = nvim-cmp;
        config = ''Utils.LoadPlugin("cmp")'';
        type = "lua";
      }
      { plugin = cmp_luasnip; }
      { plugin = cmp-nvim-lsp; }
      { plugin = cmp-buffer; }
      { plugin = cmp-path; }
    ];

    extraLuaConfig = ''
      --// Imports \\--
      Utils = require("core.utils")

      --// Core \\--
      --// Core
      require("core.options")
      require("core.maps")
      require("core.autocmds")

      --// Plugins
    '';
  };
}
