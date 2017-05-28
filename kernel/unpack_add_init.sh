#!/tmp/busybox sh
cd /tmp
mkdir ramdisk
cd ramdisk
/tmp/busybox gzip -dc ../boot.img-ramdisk.gz | /tmp/busybox cpio -i
if [ -z `/tmp/busybox grep init.d init.p3.rc` ]; then
echo '' >>init.p3.rc
#echo 'start sysinit' >>init.p3.rc
#echo 'on property:cm.filesystem.ready=1' >>init.p3.rc
#echo '' >>init.p3.rc
echo '# Execute files in /etc/init.d before booting' >>init.p3.rc
echo 'service userinit /system/xbin/busybox run-parts /system/etc/init.d' >>init.p3.rc
#echo '    disabled' >>init.p3.rc
echo '    oneshot' >>init.p3.rc
echo '    class late_start' >>init.p3.rc
echo '    user root' >>init.p3.rc
echo '    group root' >>init.p3.rc
fi
/tmp/busybox sh -c "/tmp/busybox find . | /tmp/busybox cpio -o -H newc | /tmp/busybox gzip > ../ramdisk.gz"
cd ../
rm -r ramdisk
