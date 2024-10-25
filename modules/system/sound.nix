{config, pkgs, host,  ... }:

{

	hardware = {
		pulseaudio = {
			enable = false;
		};
	};

 	security = {
		rtkit = { 
			enable = true;
		};
	};

	services = {
		pipewire = {
		    enable = true;
    		alsa = {
				enable = true;
				support32Bit = true;
			};
			pulse = {
				enable = true;
			};
			jack = {
				enable = true;
			};
		};
	};

}
