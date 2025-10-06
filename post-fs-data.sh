# post-fs-data.sh
. "$MODPATH/system/etc/profile.d/runit.sh"
# Log Rotation & Redirection
LOGFILE="$LOGDIR/$MODID.log"
[ -f "$LOGFILE" ] && mv -f "$LOGFILE" "$LOGFILE.bak"
. "$MODPATH/system/etc/runit/1" > "$LOGFILE" 2>&1
