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
            initExtra = ''
            eval "$(direnv hook bash)"
            export PATH=$PATH:$(go env GOPATH)/bin
            '';
	 	};
	};
}
