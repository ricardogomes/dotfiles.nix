{config, pkgs, ... }:

{
	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;
	};

	environment = {
		pathsToLink = [ "/libexec" ];
	};
}
