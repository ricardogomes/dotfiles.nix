{ config, pkgs, callPackage, ... }:

{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-57-6.15.7"
    "broadcom-sta-6.30.223.271-57-6.6.99"
    "broadcom-sta-6.30.223.271-57-6.12.39"
  ];

  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system/nixos.nix
      ../../modules/system/boot-grub.nix
      ../../modules/system/boot/macbook.nix
      ../../modules/system/security.nix
      ../../modules/system/power.nix
      ../../modules/system/locale.nix
      ../../modules/system/xserver-mac.nix
      #../../modules/system/hyprland-mac.nix
      ../../modules/system/printing.nix
      ../../modules/system/sound.nix
      ../../modules/system/user.nix
      ../../modules/system/fonts.nix
      # ../../modules/system/graphics.nix
      ../../modules/system/cleanup.nix
      ../../modules/system/services.nix
      ../../modules/virtualization
      ../../modules/applications/editors/configuration.nix
      ./packages.nix
      ./networking.nix
    ];

  system.stateVersion = "25.05";
  
  
}
