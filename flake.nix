{
	description = "Ricardo's NixOS Flake";

	inputs = {

		nixpkgs = {
			url = "github:NixOS/nixpkgs/nixos-unstable";
		};
		nixos-hardware = {
			url = "github:NixOS/nixos-hardware";
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = { self, nixpkgs, home-manager, ...}@inputs: 
		let
			vars = {
				user = "rg";
				username = "Ricardo Gomes";
				useremail = "mail@ricardogomes.me";
				dotfiles = "~/Development/github/ricardogomes/dofiles.nix";
				terminal = "alacritty";
				editor = "nvim";
			};
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in
		{
			nixosConfigurations = {
				nixdell = nixpkgs.lib.nixosSystem {
					inherit system;
					specialArgs = {
						inherit inputs vars;
						host = {
							hostName = "nixdell";
							mainMonitor = "eDP-1";
							secondMonitor = "HDMI-2";
						};
					};
					modules = [
						./hosts/nixdell/configuration.nix
					];
				};
        beelinknix = nixpkgs.lib.nixosSystem {
					inherit system;
					specialArgs = {
						inherit inputs vars;
						host = {
							hostName = "beelinknix";
						};
					};
					modules = [
						./hosts/beelinknix/configuration.nix
					];
				};
        nixapple = nixpkgs.lib.nixosSystem {
					inherit system;
					specialArgs = {
						inherit inputs vars;
						host = {
							hostName = "nixapple";
						};
					};
					modules = [
						./hosts/nixapple/configuration.nix
					];
				};
			};
			homeConfigurations = {
				${vars.user} = home-manager.lib.homeManagerConfiguration {
					inherit pkgs; 
					extraSpecialArgs = {
						inherit	vars;
					};
					modules = [
						./modules/home-manager
					];
				};
			};
		};
}


