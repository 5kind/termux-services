TERMUX_SOCKET=/dev/socket/termux

setup_tmpfs() {
    msg "Setting up tmpfs in $TERMUX_SOCKET..."
    # setup tmpfs in /dev/socket/termux
    mkdir -p "$TERMUX_SOCKET"
    mkdir -m 1777 "$TERMUX_SOCKET/tmp" "$TERMUX_SOCKET/tmp/.X11-unix"
    mkdir -m 755 "$TERMUX_SOCKET/run" "$TERMUX_SOCKET/run/dbus" \
    "$TERMUX_SOCKET/run/user" "$TERMUX_SOCKET/run/lock"
    clone_attr "$PREFIX" "$TERMUX_SOCKET" -R
    # make those directories tmpfs
    mount --bind "$TERMUX_SOCKET/tmp" "$PREFIX/tmp"
    mount --bind "$TERMUX_SOCKET/run" "$PREFIX/var/run"
}
# main
$SETUP_TMPFS &&
setup_tmpfs
