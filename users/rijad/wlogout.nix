{ config, pkgs, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
  wlogoutStyles = ''
    window {
      background-color: alpha(${colors.base00}, 0.9);
    }

    /* 6 buttons per row. You have to pass this as an argument on launch (wlogout --buttons-per-row 6) */

    button {
      background-color: ${colors.base01};
      color: ${colors.base05};
      border: none;
      border-radius: 0px;
      background-repeat: no-repeat;
      background-position: center;
      background-size: 15%;
      margin: 15em 0;
      box-shadow: none;
      transition:
          border-radius 0.15s ease,
          margin 0.15s ease,
          background-color 0.15s ease;
    }

    button:hover {
      margin: 13em 0;
      border-radius: 25px;
    }

    button:focus {
      border: none;
    }

    /* The outermost buttons should have rounded corners */
    #lock {
      border-top-left-radius: 25px;
      border-bottom-left-radius: 25px;
    }

    #shutdown {
      border-top-right-radius: 25px;
      border-bottom-right-radius: 25px;
    }

    /* Button styling */

    #lock:hover {
        background-color: ${colors.magenta};
    }

    #logout:hover {
        background-color: ${colors.blue};
    }

    #suspend:hover {
        background-color: ${colors.cyan};
    }

    #hibernate:hover {
        background-color: ${colors.green};
    }

    #reboot:hover {
        background-color: ${colors.yellow};
    }

    #shutdown:hover {
        background-color: ${colors.red};
    }

    /* Button Icons */

    #lock {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/lock.png");
    }

    #logout {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/logout.png");
    }

    #suspend {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/suspend.png");
    }

    #hibernate {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png");
    }

    #reboot {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/reboot.png");
    }

    #shutdown {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png");
    }
  '';
in
{
  # Logout screen
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "Lock";
        keybind = "l";
      }

      {
        label = "logout";
        action = "uwsm stop";
        text = "Logout";
        keybind = "e";
      }

      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }

      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }

      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }

      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }

    ];

    style = wlogoutStyles;
  };
}
