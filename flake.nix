{
  description = "Synthesis: A complete and functional NixOS configuration for my personal setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      hyprland,
      ...
    }:
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };
}
