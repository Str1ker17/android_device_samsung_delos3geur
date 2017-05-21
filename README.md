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
- It boots, so graphics
- ADB
- Internal storage
- External storage
- Sensors (proprietary)
- CPU Hotplug (proprietary)
- Lights HAL
- Wi-Fi
- Audio: speakerphone (but need more testing)
- Audio: headset
- MTP/PTP
- Flashlight

What's under development:
- Audio: microphone (not working now)
- Wi-Fi Direct (could not coexist with Wi-Fi)
- GPS
- Power HAL
- Offline charging (LPM)
- Hardware codecs

What's not working:
- RIL
- Power Profile
- Tethering (Wi-Fi nor USB)
- Camera
- Bluetooth

Known issues:
- CPU Governors could not be changed through builtin settings due to MPDecision proprietary service
- Wi-Fi static library throws errors to logcat
- thermald and mpdecision throws too much lines to logcat
- look at "TODO" file
- and don't forget about "adb logcat -C"
