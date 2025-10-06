# Use `sv` to provide compatibility with SysV-style service management.
# You must set `SVDIR` to the directory where runit services are located
# in your shell environment.
msg "Setting up SysV compatibility..."
mkdir -p $MODPATH/system/etc/init.d
cd $MODPATH/system/etc/init.d
for svc in $SVDIR/* /data/adb/modules/*/system/etc/sv/*; do
    service="${svc##*/}"
    if [ ! -L "$service" ]; then
        ln -svf "$PREFIX/bin/sv" "$service"
    fi
done
cd -
