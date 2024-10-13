{config, pkgs, ... }:

{
    services = {
        samba = {
            enable = true;
            settings = {
                global = {
                    security = "user";
                    workgroup = "WORKGROUP";
                    "server role" = "standalone server";
                    "dns proxy" = "no";
                    "pam password change" = "yes";
                    "map to guest" = "bad user";
                    "usershare allow guests" = "yes";
                    "create mask" = "0666";
                    "force create mode" = "0666";
                    "directory mask" = "0777";
                    "force directory mode" = "0777";
                    "follow symlinks" = "yes";
                    "load printers" = "no";
                    "printing" = "bsd";
                    "printcap name" = "/dev/null";
                    "disable spoolss" = "yes";
                    "strict locking" = "no";
                    #"aio read size" = 0;
                    #"aio write size" = 0;
                    "vfs objects" = "acl_xattr catia fruit streams_xattr";
                    "inherit permissions" = "yes";

                    # Security
                    "client ipc max protocol" = "SMB3";
                    "client ipc min protocol" = "SMB2_10";
                    "client max protocol" = "SMB3";
                    "client min protocol" = "SMB2_10";
                    "server max protocol" = "SMB3";
                    "server min protocol" = "SMB2_10";
                } 
           
                data = {
                    path = "/data";
                    browseable = "yes";
                    "read only" = "no";
                    writable = "yes";
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
                    writable = "yes";
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

        minecraft-server = {
            enable = true;
            eula = true;
            declarative = true;
            jvmOpts = "-Xmx4096M -Xms4096M -XX:+UseG1GC";
            package = pkgs.minecraft-server.override {
                version = "1.21.2";
                url = "https://piston-data.mojang.com/v1/objects/8d2de8704771e210d69e7b7ac70d858a677bcb70/server.jar";
                sha1 = "59353fb40c36d304f2035d51e7d6e6baa98dc05c";
                jre_headless = pkgs.jdk21;  # Specify Java 21
            };
            serverProperties = {
                level-name = "village world 1.21";
                level-seed = "2143341957457548";
                allow-flight = true;
            };
        };
    };
}



#https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar
