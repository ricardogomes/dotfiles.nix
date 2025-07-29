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
            color_degraded = "#FFFF00";
            color_bad      = "#FF0000";
        };
        modules = {
            "volume master".position = 1;
            "volume master".settings = {
                format = "󰕾 %volume";
                format_muted = "󰖁 %volume";
                device = "pulse";
                color_degraded = "#FF0000";
            };
            "ethernet _first_".position = 2;
            "ethernet _first_".settings = {
                format_up = "󰈁 %ip";
                format_down = "󰈂";
            };
            "disk /".position = 3;
            "disk /".settings = {
                format = "/:%percentage_used";
                format_not_mounted = "<span foreground='#ff0000'>/:not mounted !?!</span>";
                threshold_type = "percentage_avail";
                low_threshold = "25";
            };
            "cpu_usage".position = 4;
            "cpu_usage".settings = {
                format = "CPU:%usage";
                degraded_threshold = 60;
                max_threshold = 90;
                separator = false;
            };
            "cpu_temperature 0".position = 5;
            "cpu_temperature 0".settings = {
                format = "%degrees°C";
                max_threshold = 80;
                path = "/sys/devices/platform/coretemp.0/hwmon/hwmon0/temp1_input";
            };
            "memory".position = 6;
            "memory".settings = {
                format = "RAM:%used";
                format_degraded = "RAM:%used(%available left)";
                threshold_critical = "10%";
                threshold_degraded = "25%";
            };
            "time".position = 6;
            "time".settings = {
                format = "%Y-%m-%d %a %H:%M:%S";
            };
        };
    };

}
