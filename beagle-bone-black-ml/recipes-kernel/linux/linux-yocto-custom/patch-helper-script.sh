set -e

# don't use builtin 'echo' from /bin/sh
export ECHO="$(which echo)"

PATCHPATH="patches"

# It is essential to apply the patches in the right order !
PATCHSET="dma rtc pinctrl cpufreq adc i2c da8xx-fb pwm mmc crypto 6lowpan capebus arm omap omap_sakoman omap_beagle_expansion omap_beagle omap_panda net drm not-capebus pru usb PG2 reboot iio w1 gpmc mxt ssd130x build hdmi audio resetctrl camera resources pmic pps leds capes proto logibone fixes firmware saucy machinekit sgx backports"
# xenomai"

OUTPUT_FILE="proposed_beagle-bone-black-ml-user-patches.scc"

rm -f ${OUTPUT_FILE}

for patchset in ${PATCHSET} ; do
   for patch in $(ls -1 ${PATCHPATH}/$patchset/*.patch | sort -n) ; do
           $ECHO -e "$patch"
           $ECHO -e "patch $patch" >> ${OUTPUT_FILE}
#           read r
   done
done

echo
echo
echo ">>>>>> update your beagle-bone-black-ml-user-patches.scc file <<<<<<"
