{
  pkgs,
  ...
}:
{
  # Enable styling framework
  stylix.enable = true;
  stylix.image = ../home/wallpapers/johnny-porsche.png;
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.rose-pine-cursor;
  stylix.cursor.name = "BreezeX-RosePine-Linux";
  stylix.cursor.size = 32;

  stylix.opacity = {
    popups = 0.9;
    terminal = 0.7;
    # desktop = 1;
    # applications = 0.8;
  };

  stylix.icons = {
    enable = true;
    package = pkgs.rose-pine-icon-theme;
    dark = "rose-pine-moon";
    light = "rose-pine-dawn";
  };

  stylix.fonts = {
    sizes = {
      applications = 14;
      desktop = 12;
      terminal = 14;
    };

    serif = {
      package = pkgs.inter;
      name = "Inter";
    };

    sansSerif = {
      package = pkgs.inter;
      name = "Inter";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };
}
