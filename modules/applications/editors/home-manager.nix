{ config, pkgs, vars, ... }:

{

	programs = {
		neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
			vimdiffAlias = true;
		};	
        emacs = {
            enable = true;
        };
	};

    services = {
        emacs = enable;
    };

	home.file = {
		".config/nvim/init.lua".source = ./nvim/init.lua;
		".config/nvim/lua/" = {
			source = ./nvim/lua;
			recursive = true;
		};
        ".config/emacs/init.el".source = ./emacs/init.el;
	};

}



