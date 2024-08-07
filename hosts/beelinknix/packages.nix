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
        libvirt
        neovim 
        pciutils
        qemu
        ranger
        tmux 
        tree
        vim
        wget
    ];

}
