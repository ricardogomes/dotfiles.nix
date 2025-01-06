{ config, pkgs, vars, ... }:

{
    environment.systemPackages = with pkgs;[
        alsa-utils
    ];
}
