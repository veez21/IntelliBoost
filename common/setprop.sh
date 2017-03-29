#!/system/bin/sh
# Build.prop Tweaks (one time)

mount -o remount,rw -t auto /
mount -t rootfs -o remount,rw rootfs
mount -o remount,rw -t auto /system
mount -o remount,rw /data
mount -o remount,rw /cache

LOG=/data/intelliboost/logs/$setprop.log

# Loop to reset log values
if [ -f \$LOG ]; then
busybox rm -f \$LOG;
touch \$LOG;
else
  touch \$LOG;
fi;

echo "$( date +"%m-%d-%Y %H:%M:%S" )  Applying build.prop tweaks..." | tee -a $LOG;

# Wireless Speed Tweaks
$setprop net.tcp.buffersize.default 4096,87380,256960,4096,16384,256960
$setprop net.tcp.buffersize.wifi 4096,87380,256960,4096,16384,256960
$setprop net.tcp.buffersize.umts 4096,87380,256960,4096,16384,256960
$setprop net.tcp.buffersize.gprs 4096,87380,256960,4096,16384,256960
$setprop net.tcp.buffersize.edge 4096,87380,256960,4096,16384,256960

# Fast Dormancy
busybox echo "" | busybox tee -a \$LOG
busybox echo "Activating fast dormancy..." | busybox tee -a \$LOG
$setprop ro.fast.dormancy 1
$setprop ro.ril.fast.dormancy.rule 1
$setprop persist.radio.data_no_toggle 1
$setprop persist.cust.tel.eons 1
$setprop ro.config.hw_fast_dormancy 1
busybox echo "Fast dormancy is activated" | busybox tee -a \$LOG
# Android Logcat totally disabled

# Much battery shall be saved
$setprop logcat.live disable
busybox rm -f /dev/log/main
$setprop debugtool.anrhistory 0
$setprop profiler.debugmonitor false
$setprop profiler.launch false
$setprop profiler.hung.dumpdobugreport false
$setprop persist.android.strictmode 0

#Graphics Tweaks and improvments
$setprop debug.performance.tuning 1
$setprop video.accelerate.hw 1
$setprop persist.sys.use_dithering 1
# Google DNS
# Security and stuff
# No effect on battery
# Google DNS
$setprop net.dns1 8.8.8.8
$setprop net.dns2 8.8.4.4
$setprop net.rmnet0.dns1 8.8.8.8
$setprop net.rmnet0.dns2 8.8.4.4
$setprop net.ppp0.dns1 8.8.8.8
$setprop net.ppp0.dns2 8.8.4.4
$setprop net.wlan0.dns1 8.8.8.8
$setprop net.wlan0.dns2 8.8.4.4
$setprop net.eth0.dns1 8.8.8.8
$setprop net.eth0.dns2 8.8.4.4
$setprop net.gprs.dns1 8.8.8.8
$setprop net.gprs.dns2 8.8.4.4

#Battery Tweaks
$setprop debug.sf.hw 1
$setprop ro.ril.power_collapse 0
$setprop ro.ril.disable.power.collapse 1
$setprop persist.sys.use_dithering 0
$setprop wifi.supplicant_scan_interval 250
$setprop power_supply.wakeup enable
$setprop power.saving.mode 1
$setprop ro.config.hw_power_saving 1
$setprop ro.config.hw_power_saving true
$setprop persist.radio.add_power_save 1
$setprop pm.sleep_mode 1
$setprop ro.ril.disable.power.collapse 0
$setprop ro.vold.umsdirtyratio 20
$setprop profiler.force_disable_err_rpt 1
$setprop profiler.force_disable_ulog 1
$setprop dalvik.vm.checkjni false
$setprop dalvik.vm.execution-mode int:jit
$setprop ro.ril.power_collapse 1
$setprop ro.mot.eri.losalert.delay 1000
# Purgable assets for fast reboot and battery save
$setprop persist.sys.purgeable_assets 1
# Slightly faster boot
$setprop ro.config.hw_quickpoweron true
# Net tweaks and RIL stuff
# Support for IPV4 and IPV6
$setprop persist.telephony.support.ipv6 1
$setprop persist.telephony.support.ipv4 1
busybox sysctl -w net.ipv4.conf.all.rp_filter=2
busybox sysctl -w net.ipv4.conf.default.rp_filter=2
busybox sysctl -w net.ipv4.tcp_max_syn_backlog=1024
busybox sysctl -w net.ipv4.tcp_synack_retries=2
#RIL Tweaks
$setprop ro.ril.hsxpa 3
$setprop ro.ril.gprsclass 12
$setprop ro.ril.hep 1
$setprop ro.ril.hsdpa.category 8
$setprop ro.ril.enable.3g.prefix 1
$setprop ro.ril.hsupa.category 6
$setprop ro.ril.enable.sdr 1
$setprop ro.ril.enable.gea3 1
$setprop ro.ril.enable.a52 0
$setprop ro.ril.enable.a53 1
# FFFFFAST 3G
$setprop ro.ril.hep 0
$setprop ro.ril.hsxpa 2
$setprop ro.ril.enable.dtm 1
$setprop ro.ril.htcmaskw1.bitmask 4294967295
$setprop ro.ril.htcmaskw1 14449
# Telephony
$setprop ro.telephony.call_ring.delay 0
$setprop ring.delay 0
# Disable Sending Usage Data
$setprop ro.config.nocheckin 1
#kernel tweaks (Disable error checking)
$setprop ro.kernel.android.checkjni 0
( while [ "$(getprop sys.boot_completed)" != 1 ]; do
sleep 20
done
#Optimal dex2oat threads for faster app installation
$setprop ro.sys.fw.dex2oat_thread_count 4
#Use 4 thread to improve dex2oat time
$setprop dalvik.vm.dex2oat-thread_count 4
$setprop dalvik.vm.dex2oat-threads 4

# Davlik VM tweaks on boot
$setprop jitdalvik.vm.checkjni false
$setprop dalvik.vm.dexopt-data-only 1
$setprop dalvik.vm.heapstartsize 5m
$setprop dalvik.vm.verify-bytecode false
$setprop dalvik.vm.lockprof.threshold 250
$setprop dalvik.vm.dexopt-flags m=v,o=y
$setprop dalvik.vm.jmiopts=forcecopy

# uncertain if jit compiler will conflict with xposed framework
# higher heapgrowthlimit and heapsize values can make high mem games run lagless
# TODO: integrate this opyion into ui (not so sure if its on the fly)
$setprop dalvik.vm.heapgrowthlimit 48m
$setprop dalvik.vm.heapsize 256m

# UX
if [ "$RAM" -lt "512000" ]
then
$setprop persist.sys.force_highendgfx true /system/build.prop
$setprop ro.config.low_ram true /system/build.prop
fi

$setprop touch.pressure.scale 0.3 /system/build.prop
$setprop view.touch_slop 2 /system/build.prop
$setprop view.scroll_friction 1.5 /system/build.prop
$setprop ro.min_pointer_dur  8 /system/build.prop
$setprop touch.size.calibration geometric /system/build.prop
$setprop touch.size.scale 100 /system/build.prop
$setprop touch.size.bias 70 /system/build.prop
$setprop touch.pressure.calibration amplitude /system/build.prop
$setprop view.minimum_fling_velocity 25 /system/build.prop
$setprop ro.max.fling_velocity 12000 /system/build.prop
$setprop ro.min.fling_velocity 8000 /system/build.prop
$setprop ro.use_data_netmgrd true /system/build.prop
$setprop persist.data_netmgrd_nint 8 /system/build.prop
$setprop persist.data_netmgrd_mtu 1482 /system/build.prop

$setprop wifi.supplicant_scan_interval 180 /system/build.prop
$setprop pm.sleep_mode 1 /system/build.prop
$setprop ro.ril.disable.power.collapse 0 /system/build.prop

mount -o remount,ro -t auto /
mount -t rootfs -o remount,ro rootfs
mount -o remount,ro -t auto /system
mount -o remount,rw /data
mount -o remount,rw /cache