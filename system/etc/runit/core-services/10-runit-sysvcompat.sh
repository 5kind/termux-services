# Use `sv` to provide compatibility with SysV-style service management.
# You must set `SVDIR` to the directory where runit services are located
# in your shell environment.
[ ! -e "$MODDIR/system/etc/init.d" ] &&
mkdir -p $MODDIR/system/etc/init.d
cd $MODDIR/system/etc/init.d
for svc in $SVDIR/* /data/adb/modules/*/system/etc/sv/*; do
    service="${svc##*/}"
    if [ ! -e "$service" ] && [ ! -L "$service" ]; then
        ln -svf "$PREFIX/bin/sv" "$service"
    fi
done
cd -
