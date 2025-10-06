msg "Setting up runit services..."
# Source directory for runit service scripts (read-only).
SRC_DIR="/etc/sv"
# All service in $SRC_DIR will be copied to $SVDIR, which is the
# destination directory for runsvdir to run services.
[ ! -e /data/adb/service ] && mkdir -p /data/adb/service
for svc in $SRC_DIR/*; do
    service="${svc##*/}"
    if [ -d "$svc" ] && [ ! -e "$SVDIR/$service" ]; then
        cp -r "$svc" "$SVDIR/$service"
        chmod +x "$SVDIR/$service/*"
        [ -d "$SVDIR/$service/log" ] &&
        chmod +x "$SVDIR/$service/log/*"
    fi
done
runlevel=default
runsvdir=$(readlink /etc/runit/runsvdir)
[ -z "$runsvdir" ] && runsvdir="$RUNDIR/runit/runsvdir"
mkdir -p "$runsvdir"
ln -s "$SVDIR" "$RUNDIR/runit/runsvdir/$runlevel"
cd "$runsvdir"
ln -s "$runlevel" current
cd -
runsvchdir "${runlevel}"
