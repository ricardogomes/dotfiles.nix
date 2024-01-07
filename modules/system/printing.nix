{config, pkgs, host,  ... }:

{

  	services = {
  		printing = {
			enable = true;
  			drivers = [pkgs.hplip];
		};
		avahi = {
			enable = true;
			nssmdns4 = true;
		};
	};

	hardware = {
		sane.enable = true;
		sane.extraBackends = [ pkgs.hplipWithPlugin ];
	};
}
