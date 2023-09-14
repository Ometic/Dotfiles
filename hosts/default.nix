{ inputs, sharedModules, homeProfiles, ... }:

{
	flake.nixosConfigurations = let inherit (inputs.nixpkgs.lib) nixosSystem;
  in {
    zelix = nixosSystem {
      modules = [
        ./zelix

        {home-manager.users.ometic.imports = homeProfiles.zelix;}
      ] ++ sharedModules;
    };
  };
}
