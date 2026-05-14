{ config, pkgs, ... }:

{
  home.username = "rijad";
  home.homeDirectory = "/home/rijad";
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11";

  imports = [
    ./terminal.nix
    ./desktop.nix
    ./git.nix
    ./launcher.nix
    ./hyprland
  ];

  # Packages without further configuration
  home.packages = with pkgs; [
    mangohud
    brave
    kitty-img
    ddcutil # For brightness control
    pwvucontrol # Volume control (GUI)
    discord-canary # Discord canary supports screen sharing under wayland
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rijad/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager manage itself.
  programs.home-manager.enable = true;
}
