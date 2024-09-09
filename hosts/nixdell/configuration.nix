{ config, pkgs, callPackage, ... }:

{

  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./networking.nix
      ../../modules/system/nixos.nix
      ../../modules/system/boot.nix
      ../../modules/system/networking.nix
      ../../modules/system/locale.nix
      ../../modules/system/xserver.nix
      ../../modules/system/printing.nix
      ../../modules/system/sound.nix
      ../../modules/system/user.nix
      ../../modules/system/fonts.nix
      ../../modules/virtualization
      ../../modules/applications/editors/configuration.nix
    ];

  services.udisks2 = {
      enable = true;
  };

  services.samba = {
    enable = true;
  };

  services.gvfs = {
    enable = true;
  };

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


  networking = {
		hostName = "nixdell";
		extraHosts = 
		''
			192.168.1.254 meo.local
		    192.168.0.1 dlink1.local
  		'';
		networkmanager = {
			enable = true;
		};
		
		firewall = {
			allowedTCPPorts = [ 24800 24802 24804 ]; # Barrier
		};
	};

  system.stateVersion = "23.11"; # Did you read the comment?
  
  programs.dconf.enable = true;
}
