{ config, ... }:

{

  # Visual code editor
  programs.zed-editor = {
    enable = true;
    userSettings = {
      theme = "Rosé Pine Moon";
    };
    extensions = [ "Rosé Pine" ];
  };

  # Notification center
  services.swaync = {
    enable = true;
  };

  # Media Player control
  services.playerctld = {
    enable = true;
  };

  # Hyprland native wallpaper setter
  services.hyprpaper = {
    enable = true;
  };

  # Screen lock
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };
      background = {
        blur_passes = 2;
      };

      label = [
        # Time
        {
          monitor = "";
          text = "$TIME";
          font_size = 70;
          # font_family = "${config.lib.stylix.fonts.monospace.name}";
          color = "rgb(${config.lib.stylix.colors.base05})";
          position = "0, 7%";
          halign = "center";
          valign = "center";
        }
        # Media
        {
          monitor = "";
          text = "cmd[update:1000] song-detail";
          font_size = 14;
          # font_family = "${config.lib.stylix.fonts.monospace.name}";
          color = "rgb(${config.lib.stylix.colors.base05})";
          position = "0, 15%";
          halign = "center";
          valign = "bottom";
        }
      ];

      image = [
        # Album art
        {
          reload_time = 1;
          reload_cmd = "album-art";
          rounding = 15;
          size = 150;
          position = "0, 3%";
          border_color = "rgb(${config.lib.stylix.colors.base0D})";
          border_size = 2;
          halign = "center";
          valign = "bottom";
        }
      ];
    };
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
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 600; # 10 minutes
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1200; # 20 minutes
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800; # 30 minutes
          on-timeout = "systemctl suspend";
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
      };
    };
  };

}
