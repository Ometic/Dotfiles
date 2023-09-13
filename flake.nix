{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./home/profiles
        ./hosts
      ];
      systems = [ "x86_64-linux"  ];
      perSystem = { config, self, inputs, pkgs, system, ... }: {
        # Todo
      };
      flake = {
        # Todo
      };
    };
}
