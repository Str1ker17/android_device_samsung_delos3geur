# Samsung Galaxy Win (Grand Quatto) GT-I8552 device tree
# CyanogenMod 10.1 by Str1ker

Device is based on msm7x27a (msm7627a exactly) platform and msm8625q board.
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
- Audio: speakerphone
- Audio: headset
- Audio: microphone
- MTP/PTP
- Flashlight
- Camera: photo (rear + front) (proprietary)
- Power Profile
- Sensors (proprietary, with hacked SensorService)

What's under development:
- Wi-Fi (disconnects Wi-Fi with screen off, throws errors to logcat)
- Wi-Fi Direct (could not coexist with Wi-Fi)
- Lights HAL (with stock HAL the light is everywhere, with Google's - nowhere)
- Power HAL
- Offline charging (LPM)
- Tethering (Wi-Fi, USB)
- GPS (now stock libs, behave weird)
- Audio: front speaker

What's not working:
- RIL
- Bluetooth
- Hardware codecs
- Camera: video (OMX codecs error)

Known issues:
- Volume keys may be disabled with screen off (permissions?)
- Power off causes infinite loop and never shut down
- thermald's ONCRPC throws too much lines to logcat
- libstagefright/QCUtilityClass.cpp is hacked due to weird KeyedVector<> behaviour. Avoid hacks in future
- sensorservice/SensorDevice.cpp too

- look at "TODO" file
- and don't forget about "adb logcat -C"
