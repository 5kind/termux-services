# Environment variables for Runit Services.
[ "$(id -u)" -eq 0 ] && {
    export SVDIR=/data/adb/service
    export LOGDIR=/cache
}