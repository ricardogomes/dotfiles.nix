{ config, pkgs, vars, ... }:
let
  bashrcConfig = builtins.readFile ./resources/bashrc;
in
{
    programs = { 
  		bash = {
			enable = true;
			bashrcExtra = bashrcConfig
	 	};
	};
}
