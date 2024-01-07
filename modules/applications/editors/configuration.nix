{ config, pkgs, vars, ... }:

{
	environment.systemPackages = with pkgs; {
		helix
		neovim
		vscode
		vscodium
	};
}
