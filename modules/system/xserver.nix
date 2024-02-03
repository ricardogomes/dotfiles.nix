{config, pkgs, host,  ... }:

{

	services.xserver = {
    	enable = true;
		layout = "pt";
	    xkbVariant = "";

    	desktopManager = {
			lxqt.enable = false;
			xterm.enable = true;
    	};

		displayManager = {
			lightdm.enable = true;
			defaultSession = "none+i3";
			setupCommands = ''
        		${pkgs.xorg.xhost}/bin/xhost +SI:localuser:root
		        ${pkgs.xorg.xhost}/bin/xhost +SI:localuser:rg
                export `dbus-launch`
			'';
    	};
    
		libinput = {
			touchpad.disableWhileTyping = true;
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
