{ ... }:

{
  wayland.windowManager.hyprland.settings.window_rule = [
    {
      name = "Pwvucontrol";
      match = {
        class = "com.saivert.pwvucontrol";
      };
      float = true;
      center = true;
    }
    {
      name = "Brave Browser Dev Tools";
      match = {
        title = "DevTools(.*)";
      };
      float = true;
    }
    {
      name = "Steam Friends List";
      match = {
        class = "steam";
        title = "Friends List";
      };
      float = true;
    }
  ];
}
