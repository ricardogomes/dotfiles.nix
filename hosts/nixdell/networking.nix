{config, pkgs, host,  ... }:

{

    networking = {
        hostName = host.hostName;
		nameservers = [
			"9.9.9.9#dns.quad9.net"
			"149.112.112.112#dns.quad9.net"
		];
		extraHosts = 
		''
			192.168.1.254 meo.local
		    192.168.0.1 dlink1.local
            172.20.4.101 gd.ipleiria.pt
  		'';
		networkmanager = {
			enable = true;
			dns = "systemd-resolved";
		};
		
		firewall = {
			allowedTCPPorts = [ 24800 24802 24804 ]; # Barrier
		};
    };

	programs.nm-applet = {
		enable = true;
	};

	services.resolved = {
		enable = true;
		dnsovertls = "true"; # if issue downgrade to opportunistic
		dnssec = "allow-downgrade";
		domains = ["~."];
		fallbackDns = [
			"9.9.9.9#dns.quad9.net"
			"149.112.112.112#dns.quad9.net"
		];
	};
}
