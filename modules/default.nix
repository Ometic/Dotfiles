{ self, inputs, ... }:

{
  imports = [
    {
      _module.args = { 
        sharedModules = [
          ./core.nix

          {home-manager.useUserPackages = true;}
          {home-manager.useGlobalPkgs = true;}
          {nixpkgs.overlays=[inputs.nur.overlay inputs.neovim-nightly.overlay];}

          inputs.home-manager.nixosModule
          inputs.hyprland.nixosModules.default
        ];
      };
    }
  ];
}
