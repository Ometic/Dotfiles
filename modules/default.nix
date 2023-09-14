{ self, inputs, ... }:

{
  imports = [
    {
      _module.args = { 
        sharedModules = [
	  ./network.nix
          ./sounds.nix
	  ./security.nix
          ./fonts.nix
          ./user.nix

          {home-manager.useUserPackages = true;}
          {home-manager.useGlobalPkgs = true;}
          {nixpkgs.overlays=[inputs.nur.overlay inputs.neovim-nightly.overlay];}

          inputs.home-manager.nixosModule
        ];
      };
    }
  ];
}
