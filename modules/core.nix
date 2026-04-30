{ pkgs, ... }: {
  # Essential system-wide stuff

  programs.hyprland.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Standard packages for every user
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];

}
