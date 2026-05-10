{ inputs, pkgs, ... }:

{
  # Window Manager
  # Install Hyprland as a NixOS module
  # This is not the configuration, which is done with home-manager and wayland.windowManager.hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # Display manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
