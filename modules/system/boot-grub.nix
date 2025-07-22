{config, pkgs, ... }:

{

	boot = {
		loader = {
			grub = {
                enable = true;
                device = "/dev/sda";
                useOSProber = true;
            };
			timeout = 5;
		};
		kernelPackages = pkgs.linuxPackages_6_6;
		kernelParams = [
			"quiet"
			"loglevel=3"
			"udev.log_level=3"
			"rd.udev.log_level=3"
			"vt.global_cursor_default=0"
		];
		consoleLogLevel = 0;
	};

}
