{ config, pkgs, vars, ... }:

{
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        config = {
            modifier = "Mod4";
            terminal = "alacritty";
            gaps = {
                inner = 1;
                outer = 1;
            };
            startup = [
                { command = "nm-applet";always = false; notification = false; }
                
            ];
            bars = [
                {
                    fonts = {
                        names = ["MonaspiceKr Nerd Font Mono Propo"];
                    };
                    trayOutput = "primary";
                    statusCommand = "${pkgs.i3status}/bin/i3status ~/.config/i3status/config";
                }
            ];
        };
    };
    programs.i3status = {
        enable = true;
        enableDefault = false;
        general = {
            colors = true;
            markup = "pango";
            separator = "";
            interval = 1;
            color_good     = "#00FF00";
            color_degraded = "#b58900";
            color_bad      = "#dc322f";
        };
        modules = {
            "battery all".position = 1;
            "battery all".settings =  {
                format = "%status  %percentage  %remaining";
                status_chr = "";
                status_bat = "";
                status_full = "";
            };
            "volume master".position = 2;
            "volume master".settings = {
                format = "󰕾  %volume";
                format_muted = "󰖁  %volume";
                device = "default";
                color_degraded = "#dc322f";
            };
            "ethernet _first_".position = 3;
            "ethernet _first_".settings = {
                format_up = "󰈁  %ip";
                format_down = "󰈂";
            };
            "wireless _first_".position = 4;
            "wireless _first_".settings = {
                format_up = "  %essid";
                format_down = "󰖪";
            };
            "disk /".position = 5;
            "disk /".settings = {
                format = "  %avail";
                format_not_mounted = "<span foreground='#ff0000'>/:not mounted !?!</span>";
                threshold_type = "percentage_avail";
                low_threshold = "25";
            };
            "cpu_usage".position = 6;
            "cpu_usage".settings = {
                format = "  %usage";
                degraded_threshold = 60;
                max_threshold = 90;
                separator = false;
            };
            "cpu_temperature 0".position = 7;
            "cpu_temperature 0".settings = {
                format = "  %degrees°C";
                max_threshold = 80;
                path = "/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input";
            };
            "memory".position = 8;
            "memory".settings = {
                format = "  %used";
                format_degraded = "RAM:%used(%available left)";
                threshold_critical = "10%";
                threshold_degraded = "25%";
            };
            "time".position = 9;
            "time".settings = {
                format = "%m-%d %H:%M";
            };
        };
    };

}
