{config, pkgs, ... }:

{
	# Allow unfree packages
	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = [
	    	"electron-25.9.0"
		];
	};

	environment.systemPackages = with pkgs; [
		aircrack-ng
		alacritty
		ansible
		ansible-lint
		arandr
		blender
		brave
		barrier
		bun
		bruno
		claws
		cobra-cli
		dbeaver
		dig
		direnv
		discord
		docker-compose
		doctl
		evince
		feh
		firefox
		fractal
		gimp	
		git
		gh
		go
		go-swagger
		google-chrome 
		ghostscript
		inetutils
		insomnia
		just
		kubectl
		libreoffice-fresh
		logseq
		mongodb-compass
		neofetch
		networkmanagerapplet
		nmap
		nodejs
		nodePackages_latest.live-server
		nodePackages_latest.vercel
		nodePackages_latest.ts-node
		npm-check-updates
		nss
		nssTools
		obsidian
		openssl
		p7zip
		php81
		pdfsam-basic
		powershell
		python3Full
		ranger
		rofi
		robo3t
		rstudio
		simple-scan
		starship
		synergy
		unzip
		unrar
		virt-manager
		vlc
		xfce.thunar
		xorg.xrandr
		zotero
		teams-for-linux
		terraform
		xsel
		xorg.xhost
		wireshark
		wrk
		zoom-us
		cargo
		rustc
	];




}
