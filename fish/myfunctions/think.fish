function think
    echo -n $argv[1] | sudo tee /sys/devices/platform/i8042/serio1/serio2/sensitivity
    echo '';
    echo -n $argv[2] | sudo tee /sys/devices/platform/i8042/serio1/serio2/speed
    echo '';
end

