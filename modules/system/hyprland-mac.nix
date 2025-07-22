{config, pkgs, lib, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

  };

  # Environment variables for NVIDIA + Wayland
  environment.sessionVariables = {
    # Force software rendering to bypass NVIDIA issues
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    
    # Additional NVIDIA workarounds
    LIBGL_ALWAYS_SOFTWARE = "1";
    __GLX_VENDOR_LIBRARY_NAME = "mesa";
    
    # Disable NVIDIA-specific features
    WLR_DRM_NO_ATOMIC = "1";
    MOZ_DISABLE_RDD_SANDBOX = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    
    # General Wayland settings
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    CLUTTER_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

  # XDG portal for Wayland native dialogs and screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # Essential packages for Hyprland
  environment.systemPackages = with pkgs; [
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

  # Enable services that work well with Wayland
  services = {
    # For GNOME keyring
    gnome.gnome-keyring.enable = true;
    
    # D-Bus
    dbus.enable = true;
    
    # Enable GDM for Wayland session (alternative to LightDM)
    # You can keep LightDM if you want to switch between X11 and Wayland
    # xserver.displayManager.gdm = {
    #   enable = true;
    #   wayland = true;
    # };
  };

  # Touchpad configuration for Wayland
  services.libinput = {
    enable = true;
    touchpad = {
      disableWhileTyping = true;
      naturalScrolling = true;  # MacBook-style scrolling
      tapping = true;
      clickMethod = "clickfinger";
      accelProfile = "adaptive";
    };
  };

  # Security for Wayland
  security = {
    polkit.enable = true;
    pam.services.swaylock = {};  # Enable swaylock to unlock
  };
}