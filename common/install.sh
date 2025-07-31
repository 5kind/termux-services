cp -r -n "$MODPATH/common/$MODID" /data/adb
chmod +x "/data/adb/$MODID/svlogger"

[ -d /data/data/com.termux/files/usr ] && \
PREFIX=/data/data/com.termux/files/usr

[ -n "$PREFIX" ] && [ -f "$PREFIX/etc/fstab" ] && \
ln -sf "$PREFIX/etc/fstab" "$MODPATH/system/etc/fstab"

ui_print "Modifying rc.conf in /data/adb/$MODID to customize Termux services..."
ui_print "# /data/adb/$MODID/rc.conf"
cat /data/adb/$MODID/rc.conf
