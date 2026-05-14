{
  config,
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
    settings = {
      # "$terminal" = "kitty";
      # "$fileManager" = "kitty spf";
      # "$menu" = "rofi -show 'drun'";
      # "$mainMod" = "SUPER";
      # "$screenshot_region" = "grim -g '$(slurp)' - | swappy -f -;";
      # "$screenshot_desktop" = "grim - | swappy -f -;";
      # "$brightnessHandler" = "~/.config/hypr/scripts/brightness_ddc.sh";
    };
  };

  imports = [
    # ./animations.nix
    # ./binds.nix
    # ./decorations.nix
    # ./env.nix
    # ./general.nix
    # ./input.nix
    # ./misc.nix
    # ./monitor.nix
    # ./windows.nix
  ];
}
