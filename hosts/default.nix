{ inputs, sharedModules, homeProfiles, ... }:

{
	flake.nixosConfigurations = let inherit (inputs.nixpkgs.lib) nixosSystem;
  in {
    zelix = nixosSystem {
      modules = [
      ./zelix

      inputs.home-manager.nixosModule
      {home-manager.users.ometic.imports = homeProfiles.zelix;}
] ++ sharedModules;
    };
  };
}
