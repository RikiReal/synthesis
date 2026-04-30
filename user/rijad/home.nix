# This is the main Home Manager configuration file.
# It is used to configure Home Manager itself, as well as to define the packages, files, and environment variables that Home Manager should
# manage for the user.
{ config, pkgs, ... }:

{
    # nix.settings.experimental-features = [ "nix-command" "flakes" ];
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
        ./desktop
        # ./terminal
    ];

    # Global packages that aren't specific to the desktop or terminal
    home.packages = with pkgs; [
    ];

    programs.home-manager.enable = true;
}
