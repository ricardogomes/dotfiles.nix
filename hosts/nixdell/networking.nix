{config, pkgs, host,  ... }:

{

    networking = {
        hostName = host.hostName;
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

}