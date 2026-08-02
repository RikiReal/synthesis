{ pkgs, ... }:

let
  brightness-handler = pkgs.writeShellScriptBin "brightness-handler" ''
    # Configuration
    STATE_FILE="$XDG_RUNTIME_DIR/brightness_target"
    LOCK_FILE="$XDG_RUNTIME_DIR/brightness_target.lock"
    WOB_SOCK="$XDG_RUNTIME_DIR/wob.sock"
    STEP=5
    TIMEOUT=0.2 # 200ms

    # 1. Open file descriptor 9 and acquire an exclusive lock.
    # Rapid hotkey presses will wait here in a queue (usually for just a few milliseconds)
    # ensuring they process the updated state file sequentially.
    exec 9> "$LOCK_FILE"
    flock 9

    if [ ! -f "$STATE_FILE" ]; then
        current=$(ddcutil getvcp 10 --terse | awk -F " " '{print $4}')
        echo "$current" > "$STATE_FILE"
    fi
    val=$(cat "$STATE_FILE")

    if [ "$1" = "inc" ]; then
        val=$((val + STEP))
    else
        val=$((val - STEP))
    fi

    [ "$val" -gt 100 ] && val=100
    [ "$val" -lt 0 ] && val=0

    echo "$val" > "$STATE_FILE"
    echo "$val" > "$WOB_SOCK"

    # 2. Safely kill the previous debounce timer now that we hold the lock
    pkill -f "ddcutil-executor" || true

    # 3. Spawn the new setter in the background
    (
        # CRITICAL: Close the lock file descriptor (9) in this subshell.
        # If you do not do this, the lock will remain held while `sleep` runs,
        # defeating the purpose of the debounce and causing severe input lag.
        exec 9>&-
        exec -a ddcutil-executor bash -c "sleep $TIMEOUT && ddcutil setvcp 10 $val"
    ) &
  '';
in
{
  home.packages = [ brightness-handler ];
}
