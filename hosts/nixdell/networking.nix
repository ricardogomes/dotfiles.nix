{config, pkgs, host,  ... }:

{

    networking = {
        hostName = host.hostName;
		nameservers = [
            "1.1.1.1"
            "172.22.1.101"
			"9.9.9.9#dns.quad9.net"
			"149.112.112.112#dns.quad9.net"
		];
		extraHosts = 
		''
			192.168.1.254 meo.local
		    192.168.0.1 dlink1.local
            172.20.4.101 gd.ipleiria.pt
            172.22.21.253 apps.dei.estg.ipleiria.pt
  		'';
		networkmanager = {
			enable = true;
			#dns = "systemd-resolved";
		};
		
		firewall = {
			allowedTCPPorts = [ 24800 24802 24804 ]; # Barrier
		};
    };

	programs.nm-applet = {
		enable = true;
	};

	services.resolved = {
		enable = false;
		dnsovertls = "true"; # if issue downgrade to opportunistic
		dnssec = "allow-downgrade";
		domains = ["~."];
		fallbackDns = [
			"9.9.9.9#dns.quad9.net"
			"149.112.112.112#dns.quad9.net"
            "172.22.1.101"
            "172.22.1.102"
		];
	};
}
