# Samsung Galaxy Win (Grand Quatto) GT-I8552 device tree
# CyanogenMod 10.1 by Str1ker

Device is based on msm7x27a (msm7627a exactly) chip and msm8625 board.
If you want to build:
- disable hardware/ril directory
- get hardware/qcom/display-legacy from TheWhisp/android_hardware_qcom_display-legacy/tree/jellybean-mr2
- apply patches: 
    + patch -p1 < device/samsung/delos3geur/0001-msm7x27a-backport-patches-needed-by-cm10.patch
    + changes from 0003-android-audio-sources.repo.diff
    + cd build && git apply ../device/samsung/delos3geur/0002-build-edify-script-optional.diff && cd .. (optional)

After this, everything should be compilable. Tell me if not.

What's working:
- Graphics
- ADB
- Internal storage
- External storage
- CPU Hotplug (proprietary)
- Audio: speakerphone (but need more testing)
- Audio: headset
- Audio: microphone
- MTP/PTP
- Flashlight (if permissions to /sys/class/camera/rear/rear_flash are not lost)

What's under development:
- Wi-Fi (disconnects Wi-Fi with screen off, throws errors to logcat)
- Wi-Fi Direct (could not coexist with Wi-Fi)
- Sensors (proprietary) (need to fix libbinder)
- Lights HAL (with stock HAL the light is everywhere)
- Power HAL
- Offline charging (LPM) (testing now)
- Camera (photo works OK, video don't due to libbinder)
- Power Profile (testing now)
- Tethering (Wi-Fi, USB)
- GPS (now stock libs, behave weird)

What's not working:
- RIL
- Bluetooth
- Hardware codecs

Known issues:
- CPU Governors could not be changed through builtin settings due to MPDecision proprietary service
- Volume keys may be disabled with screen off (permissions?)
- libaudcal.so does not copy to obj/lib automatically while building
- thermald's ONCRPC throws too much lines to logcat
- look at "TODO" file
- and don't forget about "adb logcat -C"
