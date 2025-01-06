{ config, pkgs, vars, ... }:

{
    home.packages = with pkgs;[
        alsa-utils
    ];
}
