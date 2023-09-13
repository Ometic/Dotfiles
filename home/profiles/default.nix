{ inputs, withSystem, ... }:

let
  sharedModules = [../.];

  homeProfiles = {
    zelix = [./zelix.nix] ++ sharedModules;
  };

inherit (inputs.home-manager.lib) homeManagerConfiguration;
in {
  imports = [
    {_module.args = {inherit homeProfiles;};}
  ];

  flake.homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}: {
    zelix = homeManagerConfiguration {
      modules = homeProfiles.zelix;
      inherit pkgs;
    };
  });
}
