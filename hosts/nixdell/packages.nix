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
    gimp
    git
    google-chrome
    ghostscript
    inetutils
    just
    libreoffice-fresh
    hunspell
    hunspellDicts.pt-pt
    hunspellDicts.en_US
    logseq
    mongodb-compass
    networkmanagerapplet
    nixpkgs-fmt
    obsidian
    openssl
    p7zip
    pdfsam-basic
    powershell
    pstree
    ranger
    remmina
    robo3t
    rstudio
    simple-scan
    starship
    unzip
    unrar
    virt-manager
    vlc
    xfce.thunar
    xorg.xrandr
    zotero
    teams-for-linux
    xsel
    xorg.xhost
    zip
    whatsapp-for-linux
    zoom-us
    haskellPackages.typst-symbols_0_1_7
  ];

}
