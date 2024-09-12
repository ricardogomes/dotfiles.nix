{config, pkgs, vars, ... }:

{

	users = {
		users.${vars.user} = {
		    isNormalUser = true;
		    description = vars.username; 
		    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp" "libvirtd" "video"];
		};
	};
}
