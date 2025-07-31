MODDIR=${0%/*}
MODID=${MODDIR##*/}
for SCRIPT in "$MODDIR/system/bin"/* "$MODDIR/system/etc/rc.local"; do
    set_perm "$SCRIPT" 0 0 0755
done

cp -r "$MODDIR/common/termux-services" /data/adb
chmod +x /data/adb/termux-services/svlogger

[ -d /data/data/com.termux/files/usr ] && \
PREFIX=/data/data/com.termux/files/usr

[ -n "$PREFIX" ] && [ -f "$PREFIX/etc/fstab" ] && \
ln -sf "$PREFIX/etc/fstab" "$MODDIR/system/etc/fstab"

ui_print "Modifying rc.conf in /data/adb/$MODID to customize Termux services..."
ui_print "# /data/adb/$MODID/rc.conf"
cat /data/adb/$MODID/rc.conf
