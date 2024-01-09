{ config, pkgs, vars, ... }:
let
    bashrcConfig = builtins.readFile ./resources/bashrc;
    aliases = import ../aliases.nix;
in
{
    programs = { 
  		bash = {
			enable = true;
			bashrcExtra = bashrcConfig;
            shellAliases = aliases;
            interactiveShellInit = ''eval "$(direnv hook bash)"'';
	 	};
	};
}
