cp -r "$MODDIR/common/termux-services" /data/adb
chmod +x /data/adb/termux-services/svlogger

[ -d /data/data/com.termux/files/usr ] && \
PREFIX=/data/data/com.termux/files/usr

[ -n "$PREFIX" ] && [ -f "$PREFIX/etc/fstab" ] && \
ln -sf "$PREFIX/etc/fstab" "$MODDIR/system/etc/fstab"
