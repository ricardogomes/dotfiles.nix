{ config, pkgs, ... }:
{

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-27.3.11"
    ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    arandr
    brave
    barrier
    bruno
    direnv
    discord
    evince
    feh
    firefox
    flameshot
    ftb-app
    gimp
    git
    google-chrome
    ghostscript
    htop
    inetutils
    just
    libreoffice-fresh
    hunspell
    hunspellDicts.pt-pt
    hunspellDicts.en_US
    logseq
    lm_sensors
    mongodb-compass
    networkmanagerapplet
    neovim
    nixpkgs-fmt
    obsidian
    openssl
    p7zip
    pciutils
    pdfsam-basic
    powershell
    powertop
    pstree
    ranger
    remmina
    robo3t
    simple-scan
    starship
    stress
    unzip
    unrar
    virt-manager
    vlc
    vscode
    xfce.thunar
    xorg.xrandr
    zotero
    teams-for-linux
    xsel
    xorg.xhost
    zip
    whatsapp-for-linux
    wget
    zoom-us
    haskellPackages.typst-symbols_0_1_7
  ];

}
