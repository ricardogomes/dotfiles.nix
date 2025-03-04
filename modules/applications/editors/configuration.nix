{ config, pkgs, vars, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    neovim
    vscode
    vscodium
    emacs
    ripgrep
    fd
    imagemagick
    zstd
    sqlite
    cmake
    gnumake
    nixfmt-classic
    shfmt
    shellcheck
    emacsPackages.vterm
    libgcc
    gcc
    libtool
    libvterm
    libsForQt5.okular
    code-cursor
  ];

  services.emacs = { enable = true; };
}
