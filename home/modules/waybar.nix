{
  ...
}:
{

  stylix.targets.waybar.addCss = false;

  # Status bar
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 30;

        modules-left = [
          "custom/notifications"
          "hyprland/workspaces"
          "mpris"
        ];
        modules-center = [
          "custom/weather"
          "clock"
        ];
        modules-right = [
          "cava"
          "wireplumber"
          "cpu"
          "memory"
          "disk"
          "network"
          "tray"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            active = "󰜋";
            default = "󰜌";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        mpris = {
          format = "{player_icon} {dynamic} {player_icon}";
          dynamic-order = [
            "artist"
            "title"
            "album"
          ];
          dynamic-len = 60;
          player-icons = {
            default = "🎵";
          };
        };

        "custom/weather" = {
          format = "{}";
          interval = 3600;
          exec = "uwsm app -- curl -s 'https://wttr.in/?format=1'";
          exec-if = "uwsm app -- ping wttr.in -c1";
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";

          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;

            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };

          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        cava = {
          on-click = "uwsm app -- pwvucontrol";
          # The shape of cava changes depending on the volume level I set in the app? What?
          # So that means Id have to setup pipewire so that it always sends the noise at the same volume. Equalize it somehow.
          actions = {
            on-click-right = "mode";
          };
          framerate = 60;
          autosens = 2; # higher autosens means tighter height range of bars
          sensitivity = 2;
          bars = 24; # must be an even number when stereo = true
          hide_on_silence = false;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          waves = false;
          monstercat = false;
          noise_reduction = 0.9; # higher means smoother but slower curves
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          sample_rate = 48000;
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

        wireplumber = {
          format = "{volume}% {icon}";
          format-muted = "{volume}% 󰝟";
          format-icons = [
            ""
            ""
            ""
          ];
        };

        cpu = {
          format = "{usage}% ";
          on-click = "uwsm app -- kitty btop";
        };

        memory = {
          format = "{percentage}% ";
        };

        disk = {
          format = "{percentage_used}% ";
        };

        network = {
          format-ethernet = "󰌘";
          format-wifi = "{essid} ({signalStrength}%) ";
          format-disconnected = "󰌙";
          tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr} 󰌘";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };

        "custom/notifications" = {
          tooltip = false;
          format = "";
          return-type = "json";
          exec-if = "command -v swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        tray = {
          icon-size = 17;
          spacing = 7;
        };

        "custom/power" = {
          format = "󰐥";
          tooltip = false;
          on-click = "wlogout -b 6";
        };

      };
    };
    style = ''
      * {
        /* Font is set by stylix */
        padding: 0px;
        margin: 0px;

      }

      window#waybar {
        padding: 0px;
        border-style: none;
      }

      #custom-notifications,
      #workspaces,
      #mpris,
      #custom-weather,
      #clock,
      #cava,
      #wireplumber,
      #cpu,
      #memory,
      #disk,
      #network,
      #tray,
      #custom-power {
        border-style: none;

        margin: 0px;
        padding: 0px;
      }

      #workspaces button {
      }
    '';
  };

  # Terminal audio visualizer
  programs.cava = {
    enable = true;
  };
}
