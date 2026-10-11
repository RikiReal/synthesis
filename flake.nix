{
  description = "Synthesis: A complete and functional NixOS configuration for my personal setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware = {
	url = "github:NixOS/nixos-hardware";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      hyprland,
      stylix,
      nixos-hardware,
      ...
    }:
    let
      mkHost = hostName: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs hostName; };
        modules = [
          ./hosts/${hostName}/configuration.nix
        ];
      };
    in
    {
      nixosConfigurations = {
        desktop = mkHost "desktop";
        surface = mkHost "surface";
      };
    };
}
