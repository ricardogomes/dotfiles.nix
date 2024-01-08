{config, pkgs, ... }:

{

	fonts = {
		packages = with pkgs; [
			(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono"]; })
			carlito
			vegur
		    source-code-pro
		    jetbrains-mono
		    font-awesome
		];
		fontconfig = {
			defaultFonts = {
				sansSerif = [ "FiraCode" ];
				monospace = [ "DroidSansMono" ];
			};
		};
	};
}
