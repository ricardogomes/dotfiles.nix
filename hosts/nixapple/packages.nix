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
    #home-manager
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
    tor-browser
    xsel
    xorg.xhost
    zip
    whatsapp-for-linux
    wget
    zoom-us
    lsof

    # Terminal
    kitty  # GPU-accelerated terminal
    
    # App launcher
    wofi   # Wayland native launcher (dmenu replacement)
    
    # Notification daemon
    mako
    libnotify
    
    # Wallpaper
    swww   # Wayland wallpaper daemon
    
    # Bar
    waybar # Status bar
    
    # Authentication agent
    polkit_gnome
    
    # Screenshot
    grim
    slurp
    wl-clipboard
    
    # Screen locking
    swaylock-effects
    
    # Idle management
    swayidle
    
    # Display management
    wlr-randr
    kanshi  # Auto display configuration
    
    # System tray and applets
    networkmanagerapplet
    blueman
    
    # File manager
    nautilus
    
    # Additional utilities
    brightnessctl  # Brightness control
    pamixer        # Audio control
    playerctl      # Media control
  ];

}
