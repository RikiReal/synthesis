{ ... }:

{
  # Shell
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = {
        body = "fastfetch";
      };
    };
  };

  # Terminal
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      window_padding_width = 5;
    };
  };

  # Prompt
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    presets = [ "bracketed-segments" ];
  };

  # System information tool
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty";
        source = ./assets/oni-mask.png;
        height = 20;
        padding = {
          top = 1;
          left = 5;
        };
      };

      display = {
        separator = ": ";
      };
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "break"

        "shell"
        "wm"
        "theme"
        "icons"
        "font"
        "cursor"
        "terminal"
        "terminalfont"
        "break"

        "display"
        "cpu"
        "gpu"
        "memory"
        "locale"
        "break"

        {
          type = "colors";
          symbol = "block";
          block = {
            width = 5;
            range = [
              0
              7
            ];
          };
        }

      ];
    };
  };

  # File manager
  programs.superfile = {
    enable = true;
    settings = {
      theme = "rose-pine";
    };
  };
}
