# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ../../modules/system/nixos.nix
      ../../modules/system/boot.nix
      ../../modules/system/networking.nix
      ../../modules/system/locale.nix
      ../../modules/system/xserver.nix
      ../../modules/system/printing.nix
      ../../modules/system/sound.nix
      ../../modules/virtualization
    ];

 
  

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rg = {
    isNormalUser = true;
    description = "Ricardo Gomes";
    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp" "libvirtd"];
    packages = with pkgs; [
          #  thunderbird
    ];
  };


  

 


  programs.bash.interactiveShellInit = ''eval "$(direnv hook bash)"'';

  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "a";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      #set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # Mouse works as expected
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };


  system.stateVersion = "23.11"; # Did you read the comment?
  
  programs.dconf.enable = true;
}
