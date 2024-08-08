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
                    #"create mask" = "0666";
                    #"directory mask" = "0666";
                    #"force user" = "rg";
                    #"force group" = "users";
                    "valid users" = "rg";
                };
                ssd = {
                    path = "/ssd";
                    browseable = "yes";
                    "read only" = false;
                    "guest ok" = "no";
                    #"create mask" = "0666";
                    #"directory mask" = "0666";
                    "valid users" = "rg";
                    #"force user" = "rg";
                    #"force group" = "users";
                };
            };
        };  
    };
}