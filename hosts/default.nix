{ inputs, homeProfiles, ... }:

{
	flake.nixosConfigurations = let inherit (inputs.nixpkgs.lib) nixosSystem;
  in {
    zelix = nixosSystem {
      modules = [
      ./zelix/hardware-configuration.nix
      ../configuration.nix
      inputs.home-manager.nixosModule
      {home-manager.useUserPackages = true;}
      {home-manager.useGlobalPkgs = true;}
      {home-manager.users.ometic.imports = homeProfiles.zelix;}
      {nixpkgs.overlays = [inputs.nur.overlay];}
];
    };
  };
}
