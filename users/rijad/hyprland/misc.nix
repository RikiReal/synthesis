{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.config = {
    misc = {
      vrr = 2;
      focus_on_activate = true;
      font_family = "JetBrains Mono";
      key_press_enables_dpms = true;
    };
    render = {
      direct_scanout = 1;
    };
  };
}
