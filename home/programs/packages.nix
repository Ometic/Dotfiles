{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Gui
    _1password _1password-gui
    (pkgs.discord.override { withVencord = true; })

    # Cli
    xdg-utils
  ];
}
