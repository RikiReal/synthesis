{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/windowManager.nix
    ../../modules/hardware-amd.nix
    ../../modules/gaming.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];
}
