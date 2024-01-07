{config, pkgs, host,  ... }:

{

	virtualisation = {
		docker = {
			enable = true;
		    extraOptions = "--default-address-pool base=10.10.0.0/16,size=24";
		};

		libvirtd = {
			enable = true;
		};
	};

}
