# Source directory for runit service scripts (read-only).
SRC_DIR="/etc/sv"
# All service in $SRC_DIR will be copied to $SVDIR, which is the
# destination directory for runsvdir to run services.
for svc in $SRC_DIR/*; do
    service="${svc##*/}"
    if [ -d "$svc" ] && [ ! -e "$SVDIR/$service" ]; then
        cp -r "$svc" "$SVDIR/$service"
        chmod +x "$SVDIR/$service/*"
        [ -d "$SVDIR/$service/log" ] &&
        chmod +x "$SVDIR/$service/log/*"
    fi
done
# Create symlinks for runit supervise directories.
# `runsvdir` will create supervise directories for each service
for svc in $SVDIR/*; do
    service="${svc##*/}"
    if [ ! -L "$svc/supervise" ]; then
        rm -rf "$svc/supervise"
        ln -sf "$RUNDIR/runit/supervise.$service" "$svc/supervise"
    fi
    if [ ! -L "$svc/log/supervise" ]; then
        rm -rf "$svc/log/supervise"
        ln -sf "$RUNDIR/runit/supervise.$service-log" "$svc/log/supervise"
    fi
done