# post-fs-data.sh
[ -f /etc/rc.conf ] && . /etc/rc.conf
# Log Rotation & Redirection
LOGFILE="$LOGDIR/$MODID.log"
[ -f "$LOGFILE" ] && mv -f "$LOGFILE" "$LOGFILE.bak"
[ -f /etc/runit/1 ] && . /etc/runit/1 > "$LOGFILE" 2>&1
