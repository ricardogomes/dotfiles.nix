{config, pkgs, lib, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # For NVIDIA, though legacy drivers may have issues
    enableNvidiaPatches = true;
  };

  # Environment variables for NVIDIA + Wayland
  environment.sessionVariables = {
    # If you have issues, try uncommenting these NVIDIA-specific vars
    # WLR_NO_HARDWARE_CURSORS = "1";  # If cursor is invisible
    # NIXOS_OZONE_WL = "1";           # For Electron apps
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # GBM_BACKEND = "nvidia-drm";
    # __GL_GSYNC_ALLOWED = "0";
    # __GL_VRR_ALLOWED = "0";
    # WLR_DRM_NO_ATOMIC = "1";
    
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

    xserver.displayManager = {
        lightdm.enable = true;
        
        setupCommands = ''
            ${pkgs.xorg.xhost}/bin/xhost +SI:localuser:root
            ${pkgs.xorg.xhost}/bin/xhost +SI:localuser:rg
            export `dbus-launch`
        '';
    };

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