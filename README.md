# Samsung Galaxy Win (Grand Quatto) GT-I8552 device tree
# CyanogenMod 10 by Str1ker

Device is based on msm7x27a (msm7627a exactly) chip and msm8625 board.
If you want to build, disable hardware/ril directory first.

What's working:
- It boots, so graphics
- ADB
- Internal storage
- External storage
- Sensors (proprietary)
- Lights HAL
- CPU Hotplug (proprietary)
- Wi-Fi


What's under development:
- Audio: speakerphone
- Audio: microphone
- Audio: headset
- MTP/PTP
- Wi-Fi Direct
- GPS (HAL build OK, but LocationProvider causes permanent wakelock, so it's turned off)

What's not working:
- RIL
- Power Profile
- Power HAL
- Flashlight
- Tethering (Wi-Fi nor USB)
- Hardware codecs
- Camera
- Bluetooth

Known issues:
- Audio: speakerphone is too quiet
- Audio: microphone is too quiet too
- Something causes some apps (like ForPDA) to crash
- CPU Governors could not be changed through builtin settings due to MPDecision proprietary service