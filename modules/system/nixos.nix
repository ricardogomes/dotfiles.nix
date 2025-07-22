{config, pkgs, ... }:

{
	nix = {
		settings = {
			experimental-features = [ 
				"nix-command" 
				"flakes" 
			];
    		system-features = [
				"kvm"
				"big-parallel"
				"nixos-test"
			];
			auto-optimise-store = true;
		};
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than +3";
		};
	};

	environment = {
		pathsToLink = [ "/libexec" ];
	};

  programs = {
    dconf = {
      enable = true;
    };
  };
}
