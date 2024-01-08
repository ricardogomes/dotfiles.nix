{ config, pkgs, vars, ... }:

{
    environment.systemPackages = with pkgs;[
        bash
        bash-completion
    ];
}
