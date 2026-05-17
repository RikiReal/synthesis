{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/desktop.nix
    ../../modules/hardware-amd.nix
    ../../modules/gaming.nix
    ../../modules/users.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
    ../../modules/stylix.nix
  ];
}
