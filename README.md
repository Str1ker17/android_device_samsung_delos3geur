# Samsung Galaxy Win (Grand Quatto) GT-I8552 device tree
# CyanogenMod 10.1 by Str1ker

Device is based on msm7x27a (msm7627a exactly) chip and msm8625 board.
If you want to build:
- disable hardware/ril directory
- get hardware/qcom/display-legacy from github.com/TheWhisp/android_hardware_qcom_display-legacy/tree/jellybean-mr2
- apply patches: patch -p1 < device/samsung/delos3geur/0001-msm7x27a-backport-patches-needed-by-cm10.patch

Some source files patches are not included there. They will be included when I will have more time.
Though, everything should be compilable.

What's working:
- It boots, so graphics
- ADB
- Internal storage
- External storage
- Sensors (proprietary)
- Lights HAL
- CPU Hotplug (proprietary)
- Wi-Fi
- Audio: speakerphone (but need more testing)
- Audio: headset
- MTP/PTP
- Flashlight

What's under development:
- Audio: microphone (not tested yet)
- Wi-Fi Direct (could not coexist with Wi-Fi)
- GPS (HAL build OK, but LocationProvider from cm10 causes permanent wakelock, so it's turned off)
- Hardware codecs
- Power HAL
- Offline charging (LPM)

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
