{ config, ... }:

{
  programs.git = {
    enable = true;

    userEmail = "iam.ometic@pm.me";
    userName = "Ometic";
  };
}
