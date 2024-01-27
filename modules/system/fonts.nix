{config, pkgs, ... }:

{

	fonts = {
		packages = with pkgs; [
			(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Monaspace"]; })
			noto-fonts-emoji
		    font-awesome
		];
		fontconfig = {
			defaultFonts = {
				sansSerif = [ "FiraCode" ];
				monospace = [ "Monaspace" ];
			};
		};
	};
}
