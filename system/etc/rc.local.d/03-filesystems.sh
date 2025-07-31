# *-*-shell-*-*
# vim: set ts=4 sw=4 et:

# Note: By default, Termux's mount tools use $PREFIX/etc/fstab instead of /etc/fstab.
# It is recommended to symlink /etc/fstab to $PREFIX/etc/fstab to ensure compatibility
# with mount utilities such as toybox, busybox, and Termux's own tools.

mount_filesystems() {
    if [ ! -e /etc/fstab ]; then
        msg_warn "No /etc/fstab found, skipping mount point creation & mounting."
        return 0
    fi
    msg "Starting to process /etc/fstab for mount point creation & mounting..."

    cat /etc/fstab | grep -vE '^(#|$|swap)' | awk '{print $1, $2}' | while read -r device mount_point; do
        # Check if the device exists
        if [ ! -e "$mount_point" ]; then
            if [ -b "$device" ] || [ -d "$device" ] || [ ! -e "$device" ]; then
                mkdir -vpm 000 "$mount_point"
            else
                install -vDm 000 /dev/null "$mount_point"
            fi
        fi

    done

    mount -v -a -t "nosysfs,nonfs,nonfs4,nosmbfs,nocifs" -O no_netdev
    msg "Finished processing /etc/fstab."
}

mount_filesystems
