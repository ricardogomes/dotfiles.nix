{config, pkgs, ... }:

{

	fonts = {
		packages = with pkgs; [
			(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono"]; })
		];
		fontconfig = {
			defaultFonts = {
				sansserif = [ "FiraCode" ];
				monospace = [ "DroidSansMono" ];
			};
		};
	}


}
