{ pkgs, ... }:

let
  brightness-handler = pkgs.writeShellScriptBin "brightness-handler" ''
    # Configuration
    STATE_FILE="$XDG_RUNTIME_DIR/brightness_target"
    WOB_SOCK="$XDG_RUNTIME_DIR/wob.sock"
    STEP=5
    TIMEOUT=1

    if [ ! -f "$STATE_FILE" ]; then
        current=$(ddcutil getvcp 10 --terse | awk -F " " '{print $4}')
        echo "$current" > "$STATE_FILE"
    fi
    val=$(cat "$STATE_FILE")

    if [ "$1" = "inc" ]; then
        val=$((val + STEP))
    elif [ "$1" = "off" ]; then
        val=0
    elif [ "$1" = "dec" ]; then
        val=$((val - STEP))
    fi

    [ "$val" -gt 100 ] && val=100
    [ "$val" -lt 0 ] && val=0

    if [ "$1" != "off" ]; then
        echo "$val" > "$STATE_FILE"
    fi

    echo "$val" > "$WOB_SOCK"

    pkill -f "ddcutil-executor" || true

    (
        exec -a ddcutil-executor bash -c "sleep $TIMEOUT && ddcutil setvcp 10 $val"
    ) &
  '';
in
{
  home.packages = [ brightness-handler ];
}
