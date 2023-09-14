{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [];
    };

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/b0d86cd4-cd57-40cf-91c0-b9d8ca1bcec1";

  fileSystems."/" = { 
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@" "compress=zstd" "space_cache=v2" "discard=async" "ssd" ];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@home" "compress=zstd" "space_cache=v2" "discard=async" "ssd" ];
  };

  fileSystems."/.snapshots" = { 
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@snapshots" "compress=zstd" "space_cache=v2" "discard=async" "ssd" ];
  };

  fileSystems."/var/log" = { 
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@log" "compress=zstd" "space_cache=v2" "discard=async" "ssd" ];
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
