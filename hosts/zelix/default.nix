{ config, pkgs, ... }:

{
  imports = [./hardware-configuration.nix];

  networking.hostName = "zelix"; 
  time.timeZone = "Asia/Bangkok";

  i18n.defaultLocale = "en_US.UTF-8";

  zramSwap.enable = true;

  # Temp
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    foot
    pulseaudio
  ];

  programs.hyprland.enable = true;
  services.openssh.enable = true;

  system.stateVersion = "23.05";
}
