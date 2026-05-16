{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.config.monitor = {
    output = "DP-3";
    mode = "highrr";
    scale = "auto";
    position = "auto";
    cm = "auto";
    vrr = "2";
  };
}
