#!/system/bin/sh
# Assertive display script
# run this in update bin
prop=/system.build.prop
if grep -q msm "$prop";
then
	echo "Qualcomm device detected! Applying..."
	echo "
	" >> /system/build.prop
	echo "### Assertive Display ###" >> /system/build.prop
    setprop ro.qcom.ad 1
    setprop ro.qcom.ad.calib.data /system/etc/ad_calib.cfg
 chmod 755 /system/ad_calib.cfg
    echo "By @ala_mo" >> /system/build.prop
else
rm -f /system/etc/ad_calib.cfg
fi