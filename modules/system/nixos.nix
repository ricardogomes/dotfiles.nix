{config, pkgs, ... }:

{
	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;
	};

#	nix.settings.experimental-features = [ "nix-command" "flakes" ];

#	nix.settings.auto-optimise-store = true;
}
