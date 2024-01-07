{config, pkgs, host,  ... }:

{

	networking = {
		hostName = host.hostName;
		useDHCP = true;
		extraHosts = 
		''
			192.168.1.254 meo.local
		    192.168.0.1 dlink1.local
  		'';
		networkmanager = {
			enable = true;
		};
	};
	
	programs.nm-applet = {
		enable = true;
	};
}
