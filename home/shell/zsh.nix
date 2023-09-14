{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    enableSyntaxHighlighting = true;

    shellAliases = {
      ls = "eza --icons --git";
      la = "ls --la";
      tree = "ls --tree";
      rebuild = "sudo nixos-rebuild switch --flake $NIXOS_CONFIG_DIR";
    };
  };  
}
