{ inputs, pkgs, ... }:

let
  sddm-astronaut = (
    pkgs.sddm-astronaut.override {
      embeddedTheme = "jake_the_dog";
    }
  );
in
{
  # Enable cache for Hyprland and its dependencies.
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # Window Manager
  # Install Hyprland as a NixOS module
  # This is not the configuration, which is done with home-manager and wayland.windowManager.hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = [ sddm-astronaut ];

  # Display manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia # Required for video backgrounds/audio
    ];
    theme = "sddm-astronaut-theme";
  };
}
