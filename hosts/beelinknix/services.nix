{config, pkgs, ... }:

{
    services = {
        samba = {
            enable = true;
            securityType = "user";
            extraConfig = ''
                workgroup = WORKGROUP
                server role = standalone server

                # Security
                client ipc max protocol = SMB3
                client ipc min protocol = SMB2_10
                client max protocol = SMB3
                client min protocol = SMB2_10
                server max protocol = SMB3
                server min protocol = SMB2_10
            '';
            shares = {
                data = {
                    path = "/data";
                    browseable = "yes";
                    "read only" = "no";
                    writable = "yes";
                    "guest ok" = "yes";
                    #"create mask" = "0666";
                    #"directory mask" = "0666";
                    #"force user" = "rg";
                    #"force group" = "users";
                    #"valid users" = "rg";
                };
                ssd = {
                    path = "/ssd";
                    browseable = "yes";
                    writable = "yes";
                    "read only" = false;
                    "guest ok" = "yes";
                    #"create mask" = "0666";
                    #"directory mask" = "0666";
                    #"valid users" = "rg";
                    #"force user" = "rg";
                    #"force group" = "users";
                };
            };
        };  
    };
}