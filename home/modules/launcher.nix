{ pkgs, config, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{

  stylix.targets.rofi.alternatePattern = false;

  # Qalculate! calculator, powerful, can be used from the terminal or integrated with e.g. rofi
  programs.qalculate.enable = true;

  programs.rofi = {
    enable = true;
    terminal = "kitty";
    modes = [
      "drun"
      "window"
      "calc"
    ];
    cycle = true;
    plugins = with pkgs; [
      rofi-calc
    ];
    theme = {
      configuration = {
        display-drun = "";
        # display-run = "";
        # display-filebrowser = "";
        display-window = "";
        display-calc = "";

        ### General settings ###
        cycle = true;
        icon-theme = "rose-pine-moon";
        case-sensitive = false;
        case-smart = false;
        # modes = [ "combi" ]; # Already set above, but can be set here too.
        # font = "JetBrainsMono Nerd Font Mono 12"; # Managed by stylix
        normalize-match = true;
        steal-focus = false;
        # filter = ;
        show-icons = true;
        scroll-method = 0;
        # dpi = -1;
        # cache-dir = ;
        # terminal = "kitty"; # Already set above, but can be set here too.
        location = 0;
        yoffset = 0;
        xoffset = 0;
        fixed-num-lines = true;

        ### Combi settings ###
        combi-modes = "window,run";
        combi-hide-mode-prefix = false;
        combi-display-format = "{mode} {text}";

        ### Matching settings ###
        matching = "normal";
        tokenize = true;

        ### SSH settings ###
        # ssh-client = "ssh";
        # ssh-command = "{terminal} -e {ssh-client} {host} [-p {port}]";
        parse-hosts = false;
        parse-known-hosts = true;

        ### Drun settings ###
        drun-match-fields = "name,generic,exec,categories,keywords";
        # drun-categories = ;
        # drun-exclude-categories = ;
        drun-show-actions = false;
        drun-display-format = "{name}";
        drun-url-launcher = "xdg-open";
        drun-use-desktop-cache = false;
        drun-reload-desktop-cache = false;

        ### Run Settings ###
        # run-command = "{cmd}";
        # run-list-command = "";
        # run-shell-command = "{terminal} -e {cmd}";

        ### Window switcher settings ###
        # window-command = "wmctrl -i -R {window}";
        # window-match-fields = "all";
        window-thumbnail = false;
        window-format = "{w} · {c} · {t}";

        ### History and Sorting settings ###
        # sort = false;
        # sorting-method = "normal";
        # disable-history = false;
        # max-history-size = 25;

        ### Display settings ###
        # display-window = ;
        # display-run = ;
        # display-ssh = ;
        # display-drun = ;
        # display-combi = ;
        # display-keys = ;
        # display-filebrowser = ;
        # display-recursivebrowser = ;
        # display-calc = ;

        ### File browser settings ###
        # filebrowser {
        #     directories-first: true;
        #     sorting-method:    "name";
        # }

        ### Misc settings ###
        # ignored-prefixes = "";
        # sidebar-mode = false;
        # hover-select = false;
        # eh = 1;
        # auto-select = false;
        # preview-cmd = ;
        # on-selection-changed = ;
        # on-mode-changed = ;
        # on-entry-accepted = ;
        # on-menu-canceled = ;
        # on-menu-error = ;
        # on-screenshot-taken = ;
        # m = "-5";
        # threads = 0;
        # click-to-exit = true;
        # global-kb = false;
        # matching-negate-char = '-'
        # application-fallback-icon = ;
        # refilter-timeout-limit = 300;
        # xserver-i300-workaround = false;
        # completer-mode = "filebrowser";
        # imdkit = true;
        # pid = "/run/user/1000/rofi.pid";
        # timeout {
        #     action: "kb-cancel";
        #     delay:  0;
        # }

        ### Keybindings settings ###
        # Rofi-calc: Select history with Return and input with Ctrl+Return, delete with Shift+Delete
        kb-mode-next = "Tab";
        kb-mode-previous = "Shift+Tab";
        kb-element-next = "Control+Tab";
        kb-element-prev = "Control+Shift+Tab";
        # kb-primary-paste = "Control+V,Shift+Insert";
        # kb-secondary-paste = "Control+v,Insert";
        # kb-secondary-copy = "Control+c";
        # kb-clear-line = "Control+w";
        # kb-move-front = "Control+a";
        # kb-move-end = "Control+e";
        # kb-move-word-back = "Alt+b,Control+Left";
        # kb-move-word-forward = "Alt+f,Control+Right";
        # kb-move-char-back = "Left,Control+b";
        # kb-move-char-forward = "Right,Control+f";
        # kb-remove-word-back = "Control+Alt+h,Control+BackSpace";
        # kb-remove-word-forward = "Control+Alt+d";
        # kb-remove-char-forward = "Delete,Control+d";
        # kb-remove-char-back = "BackSpace,Shift+BackSpace,Control+h";
        # kb-remove-to-eol = "Control+k";
        # kb-remove-to-sol = "Control+u";
        # kb-accept-entry = "Control+j,Control+m,Return,KP_Enter";
        # kb-accept-custom = "Control+Return";
        # kb-accept-custom-alt = "Control+Shift+Return";
        # kb-accept-alt = "Shift+Return";
        # kb-delete- = "Shift+Delete";
        # kb-mode-complete = "Control+l";
        # kb-row-left = "Control+Page_Up";
        # kb-row-right = "Control+Page_Down";
        # kb-row-up = "Up,Control+p";
        # kb-row-down = "Down,Control+n";
        # kb-row-tab = "";
        # kb-page-prev = "Page_Up";
        # kb-page-next = "Page_Down";
        # kb-row-first = "Home,KP_Home";
        # kb-row-last = "End,KP_End";
        # kb-row-select = "Control+space";
        # kb-screenshot = "Alt+S";
        # kb-ellipsize = "Alt+period";
        # kb-toggle-case-sensitivity = "grave,dead_grave";
        # kb-toggle-sort = "Alt+grave";
        # kb-cancel = "Escape,Control+g,Control+bracketleft";
        # kb-custom-1 = "Alt+1";
        # kb-custom-2 = "Alt+2";
        # kb-custom-3 = "Alt+3";
        # kb-custom-4 = "Alt+4";
        # kb-custom-5 = "Alt+5";
        # kb-custom-6 = "Alt+6";
        # kb-custom-7 = "Alt+7";
        # kb-custom-8 = "Alt+8";
        # kb-custom-9 = "Alt+9";
        # kb-custom-10 = "Alt+0";
        # kb-custom-11 = "Alt+exclam";
        # kb-custom-12 = "Alt+at";
        # kb-custom-13 = "Alt+numbersign";
        # kb-custom-14 = "Alt+dollar";
        # kb-custom-15 = "Alt+percent";
        # kb-custom-16 = "Alt+dead_circumflex";
        # kb-custom-17 = "Alt+ampersand";
        # kb-custom-18 = "Alt+asterisk";
        # kb-custom-19 = "Alt+parenleft";
        # kb-select-1 = "Super+1";
        # kb-select-2 = "Super+2";
        # kb-select-3 = "Super+3";
        # kb-select-4 = "Super+4";
        # kb-select-5 = "Super+5";
        # kb-select-6 = "Super+6";
        # kb-select-7 = "Super+7";
        # kb-select-8 = "Super+8";
        # kb-select-9 = "Super+9";
        # kb-select-10 = "Super+0";
        # kb-entry-history-up = "Control+Up";
        # kb-entry-history-down = "Control+Down";
        # kb-matcher-up = "Super+equal";
        # kb-matcher-down = "Super+minus";
        # ml-row-left = "ScrollLeft";
        # ml-row-right = "ScrollRight";
        # ml-row-up = "ScrollUp";
        # ml-row-down = "ScrollDown";
        # me-select-entry = "MousePrimary";
        # me-accept-entry = "MouseDPrimary";
        # me-accept-custom = "Control+MouseDPrimary";
      };

      ###################################
      # Beginning of rasi theme section #
      ###################################

      # Disable all coloring in the theme file, because this is handled by stylix. This is to avoid conflicts between the two.
      #
      /**
        Author : Aditya Shakya (adi1090x)
        Github : @adi1090x

        Rofi Theme File
        Rofi Version: 1.7.3
      */
      # https://github.com/adi1090x/rofi/blob/master/files/launchers/type-1/style-5.rasi
      # "*" = {
      #   border-colour = mkLiteral "var(selected)";
      #   handle-colour = mkLiteral "var(selected)";
      #   background-colour = mkLiteral "var(background)";
      #   foreground-colour = mkLiteral "var(foreground)";
      #   alternate-background = mkLiteral "var(background-alt)";
      #   normal-background = mkLiteral "var(background)";
      #   normal-foreground = mkLiteral "var(foreground)";
      #   urgent-background = mkLiteral "var(urgent)";
      #   urgent-foreground = mkLiteral "var(background)";
      #   active-background = mkLiteral "var(active)";
      #   active-foreground = mkLiteral "var(background)";
      #   selected-normal-background = mkLiteral "var(selected)";
      #   selected-normal-foreground = mkLiteral "var(background)";
      #   selected-urgent-background = mkLiteral "var(active)";
      #   selected-urgent-foreground = mkLiteral "var(background)";
      #   selected-active-background = mkLiteral "var(urgent)";
      #   selected-active-foreground = mkLiteral "var(background)";
      #   alternate-normal-background = mkLiteral "var(background)";
      #   alternate-normal-foreground = mkLiteral "var(foreground)";
      #   alternate-urgent-background = mkLiteral "var(urgent)";
      #   alternate-urgent-foreground = mkLiteral "var(background)";
      #   alternate-active-background = mkLiteral "var(active)";
      #   alternate-active-foreground = mkLiteral "var(background)";
      # };

      "window" = {
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = mkLiteral "600px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "10px";
        # border-color = mkLiteral "#${colors.base0D}";
        cursor = "default";
        # background-color = mkLiteral "#${colors.base00}";
      };

      "mainbox" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "30px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px 0px 0px 0px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "transparent";
        children = map mkLiteral [
          "inputbar"
          "message"
          "listview"
        ];
      };

      "inputbar" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "transparent";
        # text-color = mkLiteral "@foreground-colour";
        children = map mkLiteral [
          "textbox-prompt-colon"
          "entry"
          "mode-switcher"
        ];
      };

      "prompt" = {
        enabled = true;
        # background-color = mkLiteral "inherit";
        # text-color = mkLiteral "inherit";
      };

      "textbox-prompt-colon" = {
        enabled = true;
        padding = mkLiteral "5px 0px";
        expand = false;
        str = "";
        # background-color = mkLiteral "inherit";
        # text-color = mkLiteral "inherit";
      };

      "entry" = {
        enabled = true;
        padding = mkLiteral "5px 0px";
        # background-color = mkLiteral "inherit";
        # text-color = mkLiteral "inherit";
        cursor = mkLiteral "text";
        placeholder = "Type...";
        # placeholder-color = mkLiteral "inherit";
      };

      "num-filtered-rows" = {
        enabled = true;
        expand = false;
        # background-color = mkLiteral "inherit";
        # text-color = mkLiteral "inherit";
      };

      "textbox-num-sep" = {
        enabled = true;
        expand = false;
        str = "/";
        # background-color = mkLiteral "inherit";
        # text-color = mkLiteral "inherit";
      };

      "num-rows" = {
        enabled = true;
        expand = false;
        # background-color = mkLiteral "inherit";
        # text-color = mkLiteral "inherit";
      };

      "case-indicator" = {
        enabled = true;
        # background-color = mkLiteral "inherit";
        # text-color = mkLiteral "inherit";
      };

      "listview" = {
        enabled = true;
        columns = 1;
        lines = 8;
        cycle = true;
        dynamic = true;
        scrollbar = true;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        spacing = mkLiteral "5px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "transparent";
        # text-color = mkLiteral "@foreground-colour";
        cursor = "default";
      };

      "scrollbar" = {
        handle-width = mkLiteral "5px";
        # handle-color = mkLiteral "@handle-colour";
        border-radius = mkLiteral "10px";
        # background-color = mkLiteral "@alternate-background";
      };

      "element" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "5px 10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "10px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "transparent";
        # text-color = mkLiteral "@foreground-colour";
        cursor = mkLiteral "pointer";
      };

      "element normal.normal" = {
        # background-color = mkLiteral "var(normal-background)";
        # text-color = mkLiteral "var(normal-foreground)";
      };

      "element normal.urgent" = {
        # background-color = mkLiteral "var(urgent-background)";
        # text-color = mkLiteral "var(urgent-foreground)";
      };

      "element normal.active" = {
        # background-color = mkLiteral "var(active-background)";
        # text-color = mkLiteral "var(active-foreground)";
      };

      "element selected.normal" = {
        # background-color = mkLiteral "var(selected-normal-background)";
        # text-color = mkLiteral "var(selected-normal-foreground)";
      };

      "element selected.urgent" = {
        # background-color = mkLiteral "var(selected-urgent-background)";
        # text-color = mkLiteral "var(selected-urgent-foreground)";
      };

      "element selected.active" = {
        # background-color = mkLiteral "var(selected-active-background)";
        # text-color = mkLiteral "var(selected-active-foreground)";
      };

      "element alternate.normal" = {
        # background-color = mkLiteral "var(alternate-normal-background)";
        # text-color = mkLiteral "var(alternate-normal-foreground)";
      };

      "element alternate.urgent" = {
        # background-color = mkLiteral "var(alternate-urgent-background)";
        # text-color = mkLiteral "var(alternate-urgent-foreground)";
      };

      "element alternate.active" = {
        # background-color = mkLiteral "var(alternate-active-background)";
        # text-color = mkLiteral "var(alternate-active-foreground)";
      };

      "element-icon" = {
        # background-color = mkLiteral "transparent";
        # text-color = mkLiteral "inherit";
        size = mkLiteral "24px";
        cursor = mkLiteral "inherit";
      };

      "element-text" = {
        # background-color = mkLiteral "transparent";
        # text-color = mkLiteral "inherit";
        highlight = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };

      "mode-switcher" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "transparent";
        # text-color = mkLiteral "@foreground-colour";
      };

      "button" = {
        padding = mkLiteral "5px 10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "10px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "@alternate-background";
        # text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };

      "button selected" = {
        # background-color = mkLiteral "var(selected-normal-background)";
        # text-color = mkLiteral "var(selected-normal-foreground)";
      };

      "message" = {
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px 0px 0px 0px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "transparent";
        # text-color = mkLiteral "@foreground-colour";
      };

      "textbox" = {
        padding = mkLiteral "8px 10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "10px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "@alternate-background";
        # text-color = mkLiteral "@foreground-colour";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        highlight = mkLiteral "none";
        # placeholder-color = mkLiteral "@foreground-colour";
        blink = true;
        markup = true;
      };

      "error-message" = {
        padding = mkLiteral "10px";
        border = mkLiteral "2px solid";
        border-radius = mkLiteral "10px";
        # border-color = mkLiteral "@border-colour";
        # background-color = mkLiteral "@background-colour";
        # text-color = mkLiteral "@foreground-colour";
      };
    };
  };
}
