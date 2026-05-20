{ pkgs, ... }:
let
  album-art = pkgs.writeShellScriptBin "album-art" ''
    #!/bin/bash
    # This script fetches the current album art from playerctl and returns the path for hyprlock to use
    artUrl=$(playerctl metadata mpris:artUrl 2>/dev/null)

    # Strip 'file://' using sed and output the clean path
    echo "$artUrl" | ${pkgs.gnused}/bin/sed 's|^file://||'
  '';
in
{
  home.packages = [ album-art ];
}
