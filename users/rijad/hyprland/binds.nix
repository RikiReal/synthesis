{
  lib,
  ...
}:
let
  workspaces = lib.range 1 10;
  directions = [
    "left"
    "right"
    "up"
    "down"
  ];
  superKey = "SUPER";
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Open terminal
      {
        _args = [
          "${superKey} + RETURN"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- kitty')")
        ];
      }
      # Close active window (even during lockscreen)
      {
        _args = [
          "${superKey} + Q"
          (lib.generators.mkLuaInline "hl.dsp.window.close()")
          { locked = true; }
        ];
      }
      # Open file manager
      {
        _args = [
          "${superKey} + E"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- kitty superfile')")
        ];
      }
      # Toggle floating mode for active window
      {
        _args = [
          "${superKey} + V"
          (lib.generators.mkLuaInline "hl.dsp.window.float()")
        ];
      }
      # Open application launcher
      {
        _args = [
          "${superKey} + SPACE"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- rofi -show drun')")
        ];
      }
      # Toggle dwindle layout
      {
        _args = [
          "${superKey} + U"
          (lib.generators.mkLuaInline "hl.dsp.window.pseudo()")
        ];
      }
      # Toggle split orientation in dwindle layout
      {
        _args = [
          "${superKey} + J"
          (lib.generators.mkLuaInline "hl.dsp.layout('togglesplit')")
        ];
      }
      # Toggle fullscreen for active window
      {
        _args = [
          "${superKey} + F"
          (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")
        ];
      }
      # Pin window on all workspaces
      {
        _args = [
          "${superKey} + P"
          (lib.generators.mkLuaInline "hl.dsp.window.pin()")
        ];
      }
      # Create screenshot of an area on the active display
      {
        _args = [
          "Print"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- grim -g \"$(slurp)\" - | swappy -f -')")
        ];
      }

      # Select a window and create a screenshot of it
      {
        _args = [
          "ALT + Print"
          (lib.generators.mkLuaInline ''
            hl.dsp.exec_cmd([[uwsm app -- grim -g "$(hyprctl clients -j | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | slurp)" - | swappy -f -]])
          '')
        ];
      }
      # Create a screenshot of the entire active display
      {
        _args = [
          "CTRL + Print"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- grim - | swappy -f -')")
        ];
      }
      # Lock screen
      {
        _args = [
          "${superKey} + L"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('loginctl lock-session')")
        ];
      }

      # Volume control
      # -l 1 limits volume to 100%
      {
        _args = [
          "XF86AudioRaiseVolume"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk \\'{ if ( index($0, \"MUTE\") ) { print 0 } else { print int($2 * 100) }}\\' > $XDG_RUNTIME_DIR/wob.sock')")
          {
            repeating = true;
            locked = true; # Allow volume control during lockscreen
          }
        ];
      }
      {
        _args = [
          "XF86AudioLowerVolume"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk \\'{ if ( index($0, \"MUTE\") ) { print 0 } else { print int($2 * 100) }}\\' > $XDG_RUNTIME_DIR/wob.sock')")
          {
            repeating = true;
            locked = true; # Allow volume control during lockscreen
          }
        ];
      }
      {
        _args = [
          "XF86AudioMute"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle  && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk \\'{ if ( index($0, \"MUTE\") ) { print 0 } else { print int($2 * 100) }}\\' > $XDG_RUNTIME_DIR/wob.sock')")
          {
            locked = true; # Allow volume control during lockscreen
          }
        ];
      }
      # The event is called XF86AudioMicMute, but I dont have the key on my keyboard
      {
        _args = [
          "${superKey} + M"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle')")
        ];
      }

      # External monitor brightness control
      # Todo: Setup brightnesHandler helper script
      {
        _args = [
          "XF86MonBrightnessUp"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- brightness-handler inc')")
          { repeating = true; }
        ];
      }
      {
        _args = [
          "XF86MonBrightnessDown"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- brightness-handler dec')")
          { repeating = true; }
        ];
      }

      # Blue light filter toggle
      {
        _args = [
          "${superKey} + B"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- hyprctl hyprsunset identity')")
        ];
      }
      {
        _args = [
          "${superKey} + SHIFT + B"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- hyprctl hyprsunset temperature 3000')")
        ];
      }

      # Playback control
      {
        _args = [
          "XF86AudioNext"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- playerctl next')")
        ];
      }
      {
        _args = [
          "XF86AudioPause"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- playerctl play-pause')")
        ];
      }
      {
        _args = [
          "XF86AudioPlay"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- playerctl play-pause')")
        ];
      }
      {
        _args = [
          "XF86AudioPrev"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd('uwsm app -- playerctl previous')")
        ];
      }

      # Drag window around with the mouse
      {
        _args = [
          "${superKey} + mouse:272"
          (lib.generators.mkLuaInline "hl.dsp.window.drag()")
          { mouse = true; }
        ];
      }

      # Resize window with the mouse
      {
        _args = [
          "${superKey} + mouse:273"
          (lib.generators.mkLuaInline "hl.dsp.window.resize()")
          { mouse = true; }
        ];
      }

      # Scroll through workspaces with scrollwheel
      {
        _args = [
          "${superKey} + mouse_up"
          (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 'e+1' })")
        ];
      }
      {
        _args = [
          "${superKey} + mouse_down"
          (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 'e-1' })")
        ];
      }

      # Magic workspace
      {
        _args = [
          "${superKey} + S"
          (lib.generators.mkLuaInline "hl.dsp.workspace.toggle_special('magic')")
        ];
      }
      {
        _args = [
          "${superKey} + SHIFT + S"
          (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 'special:magic' })")
        ];
      }

      # Toggle grouping windows
      {
        _args = [
          "${superKey} + K"
          (lib.generators.mkLuaInline "hl.dsp.group.toggle()")
        ];
      }

      # Switch focus between windows in a group
      {
        _args = [
          "${superKey} + TAB"
          (lib.generators.mkLuaInline "hl.dsp.group.next()")
        ];
      }
      {
        _args = [
          "${superKey} + SHIFT + TAB"
          (lib.generators.mkLuaInline "hl.dsp.group.prev()")
        ];
      }

    ]
    ++ builtins.concatMap (
      workspace:
      let
        key = if workspace == 10 then "0" else toString workspace;
      in
      [
        # Switch to workspace
        {
          _args = [
            "${superKey} + ${key}"
            (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = ${toString workspace} })")
          ];
        }
        # Move window to workspace without switching
        {
          _args = [
            "${superKey} + SHIFT + ${key}"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = ${toString workspace}, follow = false })")
          ];
        }
        # Move window to workspace and switch
        {
          _args = [
            "${superKey} + CTRL + ${key}"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = ${toString workspace}, follow = true })")
          ];
        }
      ]
    ) workspaces
    ++ builtins.concatMap (
      direction:
      let
        x =
          if direction == "left" then
            "-15"
          else if direction == "right" then
            "15"
          else if direction == "up" then
            "0"
          else if direction == "down" then
            "0"
          else
            "0";
        y =
          if direction == "left" then
            "0"
          else if direction == "right" then
            "0"
          else if direction == "up" then
            "-15"
          else if direction == "down" then
            "15"
          else
            "0";
        directionShort = builtins.substring 0 1 direction;
      in
      [
        {
          # Move focus with superKey + arrow keys
          _args = [
            "${superKey} + ${direction}"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = '${directionShort}' })")
          ];
        }
        {
          # Move window towards a direction with superKey + SHIFT + arrow keys
          _args = [
            "${superKey} + SHIFT + ${direction}"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = '${directionShort}' })")
          ];
        }
        # Quickly resize active window with keyboard
        {
          _args = [
            "${superKey} + CTRL + ${direction}"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = '${x}', y = '${y}', relative = true })")
            { repeating = true; }
          ];
        }
        # Group window / Move a window into a group or create a group
        {
          _args = [
            "${superKey} + CTRL + SHIFT + ${direction}"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = '${directionShort}', group_aware = true })")
          ];
        }
      ]
    ) directions;
  };
}
