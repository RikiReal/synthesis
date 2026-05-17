{
  ...
}:
{
  # Status bar
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 30;

        modules-left = [
          # Add small icon here at the start of the bar
          "hyprland/workspaces"
          "mpris"
        ];
        modules-center = [
          "custom/weather"
          "clock"
        ];
        modules-right = [
          "cava"
          "cpu"
          "memory"
          "temperature"
          "disk"
          "wireplumber"
          "tray"
          "custom/power"
        ];

        "custom/power" = {
          format = "󰐥";
          tooltip = false;
          on-click = "wlogout -b 6";
        };

        cava = {
          framerate = 30;
          autosens = 1;
          sensitivity = 100;
          bars = 14;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          hide_on_silence = false;
          method = "pulse";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          waves = false;
          noise_reduction = 0.77;
          input_delay = 2;
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };

        mpris = {
          format = "{player_icon} {dynamic}";
          dynamic-order = [
            "artist"
            "title"
            "album"
          ];
          dynamic-len = 100;
          player-icons = {
            default = "🎵";
          };
        };

        clock = {
          interval = 60;
          tooltip = false;
          format = "{:%d-%m / %H:%M}";
        };

        wireplumber = {
          on_click = "pwvucontrol";
        };

        "custom/weather" = {
          format = "{}";
          interval = 3600;
          exec = "uwsm app -- curl -s 'https://wttr.in/?format=1'";
          exec-if = "uwsm app -- ping wttr.in -c1";
        };

        # "custom/networkmanager": {
        #     "exec": "sh PATH_TO_SCRIPT --status --disabled-color \"#f38ba8\" --enabled-color \"#a6e3a1\" | cat",
        #     "return-type": "raw",
        #     "format": "{}  ",
        #     "interval": 3,
        #     "rotate": 0,
        #     "on-click": "sh PATH_TO_SCRIPT,
        #     "tooltip": false
        # },
      };
    };
  };

  # Terminal audio visualizer
  programs.cava = {
    enable = true;
  };
}
