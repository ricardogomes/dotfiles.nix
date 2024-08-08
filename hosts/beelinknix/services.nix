{config, pkgs, ... }:

{
    services = {
        samba = {
            enable = true;
            securityType = "user";
            extraConfig = ''
                workgroup = WORKGROUP
                server string = smbnix
                netbios name = smbnix
                security = user 
                #use sendfile = yes
                #max protocol = smb2
                # note: localhost is the ipv6 localhost ::1
                hosts allow = 192.168.0. 127.0.0.1 localhost
                hosts deny = 0.0.0.0/0
                guest account = nobody
                map to guest = bad user
            '';
            shares = {
                data = {
                    path = "/data";
                    browseable = "yes";
                    "read only" = false;
                    "guest ok" = "no";
                };
                ssd = {
                    path = "/ssd";
                    browseable = "yes";
                    "read only" = false;
                    "guest ok" = "no";
                };
            };
        };  
    };
}