{
  pkgs,
  inputs,
  ...
}:
{
  # Explicitly enable fish shell to add vendor fish completions (NixOS Wiki)
  programs.fish.enable = true;

  users.users.rijad = {
    isNormalUser = true;
    description = "Rijad";
    extraGroups = [
      "networkmanager"
      "wheel"
      "i2c" # For brightness control
      "gamemode" # Adding power scheme management permissions
    ];
    shell = pkgs.fish;
  };

  # Home Manager import for the user.
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.rijad = import ../home/users/rijad/home.nix;
  };
}
