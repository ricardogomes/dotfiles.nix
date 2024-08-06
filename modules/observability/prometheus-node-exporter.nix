{ config, lib, pkgs, ... }:

{

    services.prometheus = {
        exporters = {
            node = {
                enable = true;
                port = 9000;
                enabledCollectors = [ "systemd" ];
                extraFlags = [ "--collector.ethtool" "--collector.softirqs" "--collector.tcpstat" ];
            };
        };
    };

}