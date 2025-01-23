{
    boot = {
        initrd = {
            enable = true;
            kernelModules = [ "lz4" "z3fold" ];

            preDeviceCommands = ''
                printf lz4 > /sys/module/zswap/parameters/compressor
                printf z3fold > /sys/module/zswap/parameters/zpool
                printf 20 > /sys/module/zswap/parameters/max_pool_percent
            '';
            verbose = false;
        };
        consoleLogLevel = 0;
        #boot.kernelModules = [ "lz4" "zbud" ];
        kernel.sysctl = { "vm.swappiness" = 10; };
        kernelParams = [
            "quiet"
            "splash"
            "loglevel=3"
            "zswap.enabled=1"
            "boot.shell_on_fail"
            "rd.udev.log_level=3"
            "udev.log_priority=3"
            "rd.systemd.show_status=false"
        ];
        loader.timeout = 0;
    };
}