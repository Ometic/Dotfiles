{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
