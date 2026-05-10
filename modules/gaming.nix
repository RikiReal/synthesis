{ pkgs, ... }:

{

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    # programs.steam.remotePlay.openFirewall = true;
    programs.steam.extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
