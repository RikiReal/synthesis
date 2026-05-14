{ config, pkgs, ... }:

{

  # Lock screen
  programs.swaylock = {
    enable = true;
  };

  # Notification center
  services.swaync = {
    enable = true;
  };

  # Logout screen
  programs.wlogout = {
    enable = true;
  };

  # Media Player control
  services.playerctld = {
    enable = true;
  };

  # Status bar
  programs.waybar = {
    enable = true;
  };

  # Visual code editor
  programs.zed-editor = {
    enable = true;
  };

}
