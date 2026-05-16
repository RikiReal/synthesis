{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.config = {
    misc = {
      vfr = true;
      vrr = 2;
      focus_on_activate = true;
      disable_hyprland_qtutils_check = true;
      font_family = "JetBrains Mono";
    };
    render = {
      direct_scanout = 1;
    };
  };
}
