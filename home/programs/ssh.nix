{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      e = {
        hostname = "20.205.243.166";
        user = "git";
      };
    };

    extraConfig = ''
    IdentityAgent ~/.1password/agent.sock
    '';
  };
}
