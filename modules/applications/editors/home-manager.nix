{ config, pkgs, vars, ... }:

{

	programs = {
		neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;

			extraConfig = ''
			lua << EOF
			      ${builtins.readFile ./nvim/init.lua}
		    EOF
			'';
		};	
	};

}



