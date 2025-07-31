wake_lock(){
    dumpsys deviceidle disable
    echo "PowerManagerService.noSuspend" | tee /sys/power/wake_lock
}

$WAKE_LOCK && wake_lock
