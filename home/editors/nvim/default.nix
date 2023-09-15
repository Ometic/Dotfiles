{ pkgs, ... }:

let
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

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      {
        plugin = catppuccin;
        config = "require('plugins.catppuccin').Config()";
        type = "lua";
      } 
    ];

    extraLuaConfig = ''
      require("core.options")
      require("core.maps")
      require("core.autocmds")
    '';
  };
}
