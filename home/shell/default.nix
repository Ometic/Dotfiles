{
  imports = [
    ./cli.nix
    ./zsh.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
