{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      openmoji-color

      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    fontconfig = {
      hinting.autohint = true;
      defaultFonts = {
        emoji = [ "OpenMoji Color" ];
      };
    };
  };
}
