{config, pkgs, host,  ... }:

{

    networking = {
        hostName = "beelinknix";
        wireless = {
            enable = true;
        };
        networkmanager = {
            enable = false;
        };
        interfaces = {
            enp1s0 = {
                ipv4.addresses = [{
                    address = "192.168.1.100";
                    prefixLength = 24;
                }];
            };
        };
        defaultGateway = {
            address = "192.168.1.254";
            interface = "enp1s0";
        };
        nameservers = ["1.1.1.1" "192.168.1.254"];
    };

    services.tailscale = {
        enable = true;
    };

}
