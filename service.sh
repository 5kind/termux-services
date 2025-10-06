# service.sh
. /etc/runit/functions
load /etc/profile.d/runit.sh
# Log Rotation & Redirection
LOGFILE="$LOGDIR/$MODID.log"
load /etc/runit/2 >> "$LOGFILE" 2>&1
