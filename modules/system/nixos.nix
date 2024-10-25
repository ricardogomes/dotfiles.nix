{config, pkgs, ... }:

{
	nix = {
		settings = {
			experimental-features = [ "nix-command" "flakes" ];
			auto-optimise-store = true;
		};
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 1w";
		};
	};

	environment = {
		pathsToLink = [ "/libexec" ];
	};
}
