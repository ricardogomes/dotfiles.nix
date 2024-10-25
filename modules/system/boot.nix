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
		kernelParams = [
			"quiet"
			"loglevel=3"
			"systemd.show_status=auto"
			"udev.log_level=3"
			"rd.udev.log_level=3"
			"vt.global_cursor_default=0"
		];
		consoleLogLevel = 0;
		initrd = {
			verbose = false;
		};
	};

}
