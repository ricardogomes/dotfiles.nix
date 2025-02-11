{config, pkgs, host,  ... }:

{

    services = {
        ollama = {
            enable = true;
            acceleration = false;
        };
    };
}
