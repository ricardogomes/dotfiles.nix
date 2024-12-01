{config, pkgs, ... }:

{

	fonts = {
		packages = with pkgs; [
			nerd-fonts.fira-code
            nerd-fonts.droid-sans-mono
            nerd-fonts.monaspace
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
