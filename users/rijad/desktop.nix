{ config, pkgs, ... }:

{

  # Visual code editor
  programs.zed-editor = {
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
    systemd.enable = true;
  };

  # Wallpaper setter (animated)
  services.awww = {
    enable = true;
  };

  # Screen lock
  programs.hyprlock = {
    enable = true;
  };

  # Command line JSON processor
  programs.jq = {
    enable = true;
  };

  # Idle manager
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        before_sleep_cmd = "loginctl lock-session";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  # Blue-light filter
  services.hyprsunset = {
    enable = true;
    settings = {
      profile = [
        {
          time = "6:00";
          identity = true;
        }
        {
          time = "21:00";
          temperature = 3000;
        }
      ];
    };
  };

  # Automount removable media
  services.udiskie = {
    enable = true;
  };

  # Wayland overlay bar (for audio, brightness, etc.)
  services.wob = {
    enable = true;
    settings = {
      "" = {
        timeout = 1000;
        max = 100;
        anchor = "bottom center";
        margin = 200;
        background_color = "1e2030";
        bar_color = "cad3f5";
        border_color = "b7bdf8";
      };
    };
  };

}
