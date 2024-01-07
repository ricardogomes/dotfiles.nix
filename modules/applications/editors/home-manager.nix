{ config, pkgs, vars, ... }:

{

	programs = {
		neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;
		};	
	};

	home.file = {
		".config/nvim/init.lua".source = ./nvim/init.lua
	
	};

}



