{
  programs.git = {
    enable = true;

    userEmail = "iam.ometic@pm.me";
    userName = "Ometic";

    extraConfig = ''
    [user]
    signingkey = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMtp59EptaeN8WrOZy4W7KtW6YFNyvVJXsih8sFllUu2

    [gpg]
    format = ssh

    [gpg "ssh"]
    program = "/etc/profiles/per-user/ometic/bin/op-ssh-sign"

    [commit]
    gpgsign = true
    '';
  };
}
