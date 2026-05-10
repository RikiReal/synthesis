{
  pkgs,
  inputs,
  ...
}:
{
  users.defaultUserShell = pkgs.zsh;

  users.users.rijad = {
    isNormalUser = true;
    description = "Rijad";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = "/bin/zsh";
    packages = with pkgs; [ discord-canary ]; # Discord canary supports screen sharing under wayland
  };

  # Home Manager import for the user.
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.rijad = import ../users/rijad/home.nix;
  };
}
