{config, pkgs, ... }:

{

	boot = {
		loader = {
			systemd-boot = {
				enable = true;
				configurationLimit = 5;
			};
			efi = {
				canTouchEfiVariables = true;
			};
			timeout = 5;
		};
		kernelPackages = pkgs.linuxPackages_latest;
	};

}
