{config, pkgs, ... }:

{

	boot = {
		kernelModules = [ 
            "applesmc" 
            "wl" 
        ];
        kernelParams = [
            "acpi_backlight=vendor"    # Better backlight control
            "i915.enable_psr=0"        # Prevent display issues if Intel GPU becomes available
        ];
        initrd =  {
            kernelModules = [ 
                "nvidia" 
            ]; 
        };
        extraModulePackages = [ 
            config.boot.kernelPackages.broadcom_sta 
        ];
        blacklistedKernelModules = [ 
            "nouveau" 
        ];
	};

    hardware = {
        graphics = { 
            enable = true;
        };
        nvidia = {
            package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
            nvidiaSettings = true;
            modesetting.enable = true;
            open = false;
        };
    };
    services = {
        xserver = {
            enable = true;
            videoDrivers = [ 
                "nvidia" 
            ];
        };
        tlp = {
            enable = true;
            settings = {
                # CPU Performance
                CPU_SCALING_GOVERNOR_ON_AC = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
                
                # CPU Frequency limits (adjust based on your CPU)
                CPU_MIN_PERF_ON_AC = 0;
                CPU_MAX_PERF_ON_AC = 100;
                CPU_MIN_PERF_ON_BAT = 0;
                CPU_MAX_PERF_ON_BAT = 70;
                
                # Thermal and energy settings
                CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
                CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
                
                # Platform profiles
                PLATFORM_PROFILE_ON_AC = "performance";
                PLATFORM_PROFILE_ON_BAT = "low-power";
                
                # Runtime power management
                RUNTIME_PM_ON_AC = "auto";
                RUNTIME_PM_ON_BAT = "auto";
                
                # WiFi power saving
                WIFI_PWR_ON_AC = "off";
                WIFI_PWR_ON_BAT = "on";
            };
        };
    };
    powerManagement = {
        enable = true;
        cpuFreqGovernor = "ondemand";  # Dynamic CPU scaling
    };
}
