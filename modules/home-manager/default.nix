{ config, pkgs, vars, ... }:

{

	imports = [
		../applications/editors/home-manager.nix
		../applications/shells/bash/home-manager.nix
	];

  home.username = vars.user;
  home.homeDirectory = "/home/${vars.user}";
  home.stateVersion = "24.05";

  home.packages = [];

  home.file = { };

  home.sessionVariables = {
   	EDITOR = vars.editor;
	  TESTING = "TESTING HOME-MANAGER";
  };

	programs.home-manager.enable = true;
}
