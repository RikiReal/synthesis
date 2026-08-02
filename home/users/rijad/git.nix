{ ... }:

# Run ssh-keygen -K to retrieve keys from yubikey on new machines.
# This is easier for a public repo. You need to add the public key in github.

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
