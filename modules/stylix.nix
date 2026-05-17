{
  config,
  pkgs,
  ...
}:
{
  # Enable styling framework
  stylix.enable = true;
  stylix.image = ../users/rijad/wallpapers/johnny-porsche.png;
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.rose-pine-cursor;
  stylix.cursor.name = "BreezeX-RosePine-Linux";
  stylix.cursor.size = 32;

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
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
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
