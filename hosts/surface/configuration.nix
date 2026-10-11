{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/surface-luks-kb-fix.nix
    ../../modules/hardware-intel.nix
    ../../modules/windowManager.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
    inputs.nixos-hardware.nixosModules.microsoft-surface-common
  ];
}
