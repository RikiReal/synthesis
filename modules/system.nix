###
# Essential system configuration, common to all machines
###

{ pkgs, ... }:

{

  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages globally
  nixpkgs.config.allowUnfree = true;

  # Automatic garbage collection of old Nix store paths
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Automatically detects files with the same content and deduplicates them
  nix.settings.auto-optimise-store = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use kernel optimized for responsiveness
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Plymouth (Animated boot screen)
  boot.plymouth = {
    enable = true;
    extraConfig = ''
      ShowDelay=0
    '';
  };

  # # Enable "Silent boot"
  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "udev.log_level=3"
    "systemd.show_status=auto"
  ];

  # Enable non-free firmware (e.g. for AMD CPU microcode updates)
  hardware.enableRedistributableFirmware = true;

  # Enable I2C (for brightness control)
  hardware.i2c.enable = true;

  # Networking
  networking.hostName = "desktop";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Printing
  services.printing.enable = true;

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Enable hyprlock (or other screen lockers) to unlock the screen
  security.pam.services.hyprlock = {
    enable = true;
  };

  # Fonts
  fonts = {
    enableDefaultPackages = true;
  };

  # Essential packages
  environment.systemPackages = with pkgs; [
    vim
    git
    fish
    wget
    curl
    btop
  ];

  # Hint electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Keyboard
  services.xserver.xkb = {
    layout = "at";
    variant = "nodeadkeys";
  };

  # Add automount capabilities for removable media
  services.udisks2.enable = true;

  # Timezone and locale
  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
