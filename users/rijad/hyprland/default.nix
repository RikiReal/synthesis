{
  pkgs,
  inputs,
  ...
}:

{

  wayland.windowManager.hyprland = {
    configType = "lua";
    enable = true;
    systemd.enable = false; # Disable systemd integration here because it's managed by UWSM
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  imports = [
    ./animations.nix
    ./binds.nix
    ./decorations.nix
    ./general.nix
    ./input.nix
    ./misc.nix
    ./monitor.nix
    ./windows.nix
    ./xdg.nix
  ];
}
