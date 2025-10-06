wake_lock(){
    msg "Acquiring wake lock to prevent device from sleeping..."
    dumpsys deviceidle disable
    echo "PowerManagerService.noSuspend" | tee /sys/power/wake_lock
}

$WAKE_LOCK && wake_lock
