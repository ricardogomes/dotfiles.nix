{config, pkgs, host,  ... }:

{
	time = { 
		timeZone = "Europe/Lisbon";
	};
	
	location = {
		provider = "geoclue2";
	};

  	i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
		    LC_ADDRESS = "pt_PT.UTF-8";
		    LC_IDENTIFICATION = "pt_PT.UTF-8";
    		LC_MEASUREMENT = "pt_PT.UTF-8";
		    LC_MONETARY = "pt_PT.UTF-8";
		    LC_NAME = "pt_PT.UTF-8";
		    LC_NUMERIC = "pt_PT.UTF-8";
		    LC_PAPER = "pt_PT.UTF-8";
		    LC_TELEP mHONE = "pt_PT.UTF-8";
		    LC_TIME = "pt_PT.UTF-8";
		};
		supportedLocales = [
			"en_US.UTF-8/UTF-8"
			"pt_PT.UTF-8/UTF-8"
		];
	};

	console = {
		keyMap = "pt-latin1";
	};
}
