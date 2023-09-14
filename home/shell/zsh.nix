{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    enableSyntaxHighlighting = true;

    shellAliases = {
      ls = "exa --icons --git";
      la = "ls --la";
      tree = "ls --tree";
      rebuild = "sudo nixos-rebuild switch --flake $NIXOS_CONFIG_DIR";
    };
  };  
}
