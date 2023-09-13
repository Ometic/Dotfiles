{ inputs, ... }:

{
	flake.nixosConfigurations = let inherit (inputs.nixpkgs.lib) nixosSystem;
  in {
    zelix = nixosSystem {
      modules = [
      ./zelix/hardware-configuration.nix
      ../configuration.nix
];
    };
  };
}
