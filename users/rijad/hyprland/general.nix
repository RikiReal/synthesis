{
  config,
  pkgs,
  inputs,
  ...
}:

{
  wayland.windowManager.hyprland.settings.config = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      layout = "dwindle";
      #     # https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
      #     col.active_border = $lavender $rosewater 45deg
      #     col.inactive_border = $crust
    };

    dwindle = {
      force_split = 2; # New windows open to the right or bottom.
      preserve_split = true;
    };
  };

}
