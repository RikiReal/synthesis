{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.config.decoration = {
    rounding = 10;
    rounding_power = 2;

    # Change transparency of focused and unfocused windows
    active_opacity = 0.95;
    inactive_opacity = 0.8;

    blur = {
      enabled = true;
      size = 8;
      passes = 3;
      vibrancy = 0.1696;
    };
  };
}
