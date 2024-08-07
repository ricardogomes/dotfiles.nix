{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./programs.nix
      ./networking.nix
      ../../modules/system/boot.nix
      ../../modules/system/locale.nix
      ../../modules/system/fonts.nix
      ../../modules/virtualization
      ../../modules/observability/prometheus-node-exporter.nix
    ];

  hardware.firmware = with pkgs; [
    linux-firmware 
  ];
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  nixpkgs.config.allowUnfree = true;

   users.users.rg = {
     isNormalUser = true;
     extraGroups = [ "wheel" "libvirtd" "docker" ]; # Enable ‘sudo’ for the user.
   };
  services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "23.11";

}


