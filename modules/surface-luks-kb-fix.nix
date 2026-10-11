{ ... }:

# https://github.com/linux-surface/linux-surface/wiki/Disk-Encryption#input-via-the-surface-aggregator-module
{
  boot.initrd.kernelModules = [
    # 1. GPIO / Intel Serial IO drivers (must load first)
    "pinctrl_tigerlake"
    "intel_lpss"
    "intel_lpss_pci"

    # 2. UART communication with the Embedded Controller
    "8250_dw"

    # 3. Surface Aggregator Module core drivers
    "surface_aggregator"
    "surface_aggregator_registry"
    "surface_aggregator_hub"
    "surface_hid_core"

    # 4. Device HID driver (Surface Laptop 5 / post-Laptop 3)
    "surface_hid"
  ];
}
