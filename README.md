<h1 align="center">Systemless Termux Services</h1>

<div align="center">
  <!-- Version -->
    <img src="https://img.shields.io/badge/Version-v0.2-blue.svg?longCache=true&style=popout-square"
      alt="Version" />
  <!-- Last Updated -->
    <img src="https://img.shields.io/badge/Updated-2025/10/06-green.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" />
  <!-- Min Magisk -->
    <img src="https://img.shields.io/badge/MinMagisk-27.0-red.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" />
  <!-- Min KSU -->
    <img src="https://img.shields.io/badge/MinKernelSU-0.9.5-red.svg?longCache=true&style=flat-square"
      alt="_time_stamp_" /></div>

<div align="center">
  <strong>Systemless Termux Services is a Magisk module that allows you to run, setup runit style services in Root permission.
  </strong>
  <h4>Also supports KSU</h4>
</div>

<div align="center">
  <h3>
    <a href="https://github.com/5kind/termux-service">
      Source Code
    </a>
  </h3>
</div>

### Usage
1. Install `termux-services` or `runit` in [termux-app](https://github.com/termux/termux-app).
2. Install `Systemless Termux Services` module.
3. Run `termux-services` to use the service manager.

### Features
#### Modify config in the [rc.conf](/data/adb/termux-services/rc.conf) to customize the behavior of the service.
1. Modify `PASSWORD` to automatically decrypt /data partitions;  
2. Modify `PREFIX` `RUNDIR` to customize the binary/run folder;  
3. Modify `SETUP_TMPFS`/`GEN_FSTAB`/`WAKE_LOCK` to enable/disable setup-tmpfs/generate_fstab/wake-lock.
#### Termux Fstab Support
- Provide [Termux fstab](/data/data/com.termux/files/usr/etc/fstab) support.
#### Build-in Services
- `crond`: By default, use /data/adb/cron as the cron directory.
#### Setup your service directory to `/etc/sv` to register a service.
1. All services in `/etc/sv` will be copied to `/data/adb/service` when `termux-services` is running.
2. All services in `/data/adb/service` except `down` will be running when `termux-services` is running.
3. You can install other modules to `/etc/sv` to register services or
manually copy services to `/data/adb/service` to register services.
#### Optional runtime
- When `runit` is not available, it use `busybox svc` to enter legacy mode.
