{config, pkgs, ... }:

{
    nixpkgs.config = {
            allowUnfree = true;
            permittedInsecurePackages = [];
    };

    environment.systemPackages = with pkgs; [
        byobu
        docker-compose
        git
        neovim 
        pciutils
        ranger
        tmux 
        tree
        vim
        wget
    ];

}
