{config, pkgs, host,  ... }:

{

 	security = {
		rtkit = { 
			enable = true;
		};
	};

	services = {
        pulseaudio = {
            enable = true;
        };
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
