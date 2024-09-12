{config, pkgs, ... }:

{
	# Allow unfree packages
	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = [
	    	"electron-27.3.11"
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
		hunspell
		hunspellDicts.pt-pt
		hunspellDicts.en_US
		logseq
		mongodb-compass
		neofetch
		networkmanagerapplet
		nmap
		nixpkgs-fmt
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
        	pstree
		ranger
        	remmina
		rofi
		robo3t
		rstudio
		rPackages.vitae
		rPackages.tidyverse
		rPackages.tibble
		simple-scan
		starship
		synergy
		unzip
		unrar
		virt-manager
		vlc
        	ventoy
		xfce.thunar
		xorg.xrandr
		zotero
		teams-for-linux
		terraform
        	udiskie
        	usermount
		xsel
		xorg.xhost
		wireshark
		wrk
		zoom-us
		cargo
		rustc
		zip
		texliveFull

		whatsapp-for-linux
		liquibase
        sqlitebrowser
	];




}
