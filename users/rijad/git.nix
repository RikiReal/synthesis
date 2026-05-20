{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user.name = "RikiReal";
      user.email = "rijad@tutanota.de";
      user.signingKey = "/home/rijad/.ssh/id_ed25519_sk.pub";
      gpg.format = "ssh";
      commit.gpgsign = true;
    };
  };
}
