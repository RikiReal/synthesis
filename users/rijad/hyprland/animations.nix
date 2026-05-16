{
  lib,
  ...
}:

{
  # name "Fast"
  # credit https://github.com/mylinuxforwork/dotfiles
  # Sligthly modified timings
  wayland.windowManager.hyprland.settings = {
    animation = [
      {
        enabled = true;
        leaf = "windows";
        speed = 2;
        style = "popin 60%";
        bezier = "md3_decel";
      }
      {
        enabled = true;
        leaf = "fade";
        speed = 2;
        bezier = "md3_decel";
      }
      {
        enabled = true;
        leaf = "workspaces";
        speed = 3.5;
        style = "slide";
        bezier = "easeOutExpo";
      }
      {
        enabled = true;
        leaf = "specialWorkspace";
        speed = 4;
        style = "slidevert";
        bezier = "easeOutExpo";
      }
    ];

    curve = [
      {
        _args = [
          "md3_decel"
          {
            type = "bezier";
            points = lib.generators.mkLuaInline "{{ 0, 0 }, { 0.58, 1 }}";
          }
        ];
      }

      {
        _args = [
          "easeOutExpo"
          {
            type = "bezier";
            points = lib.generators.mkLuaInline "{{ 0.16, 1 }, { 0.3, 1 }}";
          }
        ];
      }

    ];
  };
}
