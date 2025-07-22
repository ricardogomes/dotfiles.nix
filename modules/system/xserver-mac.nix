{config, pkgs, host,  ... }:

{

	services.libinput = {
		touchpad.disableWhileTyping = true;
	};

	services.displayManager = {
		defaultSession = "none+i3";
	};

	services.xserver = {
    	enable = true;
        xkb = {
            layout = "pt";
	        variant = "mac_nodeadkeys";
        };	

    	desktopManager = {
			lxqt.enable = false;
			xterm.enable = false;
    	};

		displayManager = {
			lightdm.enable = true;
			
			setupCommands = ''
        		${pkgs.xorg.xhost}/bin/xhost +SI:localuser:root
		        ${pkgs.xorg.xhost}/bin/xhost +SI:localuser:rg
                export `dbus-launch`
			'';
    	};
    
		

		windowManager = {
			i3  = {
		    	enable = true;
		      	package = pkgs.i3-gaps;
		      	extraPackages = with pkgs; [
		        	dmenu #application launcher most people use
        			#i3status # gives you the default i3 status bar
		        	i3lock #default i3 screen locker
        			i3blocks #if you are planning on using i3blocks over i3status
     			];
    		};
  		};
	};
}
