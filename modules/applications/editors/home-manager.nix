{ config, pkgs, vars, ... }:

{

	programs = {
		neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;

			extraConfig = ''
			:luafile ~/.config/nvim/lua/init.lua
			'';
		};	
	};

}
