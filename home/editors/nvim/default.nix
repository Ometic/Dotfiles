{ pkgs, ... }:

{
  home.file.".config/nvim/lua/core".source = ./core;

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    vimAlias = true;

    extraLuaConfig = ''
    require("core.options")
    '';
  };
}
