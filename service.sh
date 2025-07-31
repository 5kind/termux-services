# service.sh
[ -f /etc/rc.conf ] && . /etc/rc.conf
LOGFILE="$LOGDIR/$MODID.log"
[ -f /etc/runit/2 ] && . /etc/runit/2 >> "$LOGFILE" 2>&1
