{config, pkgs, ... }:

{
	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = [];
	};
    
	environment.systemPackages = with pkgs; [
        byobu
        git
        neovim 
        pciutils
        ranger
        tmux 
        tree
        vim
        wget
	];

}
