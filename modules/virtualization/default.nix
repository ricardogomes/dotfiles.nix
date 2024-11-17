{config, pkgs, host,  ... }:

{

	virtualisation = {
		docker = {
			enable = true;
			daemon = {
				settings = {
					debug = true;
					"log-level" = "debug";
				};
			};
		    extraOptions = "--insecure-registry registry.172.22.21.107.sslip.io --registry-mirror http://registry.172.22.21.107.sslip.io --default-address-pool base=10.10.0.0/16,size=24";
		};

		libvirtd = {
			enable = true;
			qemu = {
				ovmf = {
					enable = true;
				};
			};
		};
	};

}
