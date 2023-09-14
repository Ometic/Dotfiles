{ config, ... }:

{
  users.users.root.hashedPassword = "!";
  users.users.ometic = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
