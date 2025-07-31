# post-fs-data.sh
[ -f "$MODPATH/system/etc/profile.d/runit.sh" ] && \
    . "$MODPATH/system/etc/profile.d/runit.sh"
# Log Rotation & Redirection
LOGFILE="$LOGDIR/$MODID.log"
[ -f "$LOGFILE" ] && mv -f "$LOGFILE" "$LOGFILE.bak"
[ -f "$MODPATH/system/etc/runit/1" ] && \
    . "$MODPATH/system/etc/runit/1" > "$LOGFILE" 2>&1
