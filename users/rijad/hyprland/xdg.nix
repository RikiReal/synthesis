{ pkgs, ... }:
{

  xdg.portal = {
    enable = true;
    # The hyprland module installs xdg-desktop-portal-hyprland, which doesnt have a file picker, so we need to add xdg-desktop-portal-gtk
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    config = {
      common = {
        default = [
          "hyprland"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [
          "gtk"
        ];
      };
    };
  };
}
