{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "kitty";
    modes = [ "combi" ];
    cycle = true;
    plugins = with pkgs; [
      rofi-network-manager
      rofi-calc
    ];
  };

  # Qalculate! calculator, powerful, can be used from the terminal or integrated with e.g. rofi
  programs.qalculate.enable = true;
}
