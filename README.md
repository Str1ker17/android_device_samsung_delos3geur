# Samsung Galaxy Win (Grand Quatto) GT-I8552 device tree
# CyanogenMod 10 by Str1ker

If you want to build, disable hardware/ril directory first.

What's working:
- It boots, so graphics
- ADB
- Internal storage
- External storage (need testing for inject/eject)
- Sensors (proprietary)
- Lights HAL
- Audio: speakerphone
- Audio: microphone
- CPU Hotplug (proprietary)
- Wi-Fi

What's not working:
- Wi-Fi Direct
- RIL
- GPS (HAL build OK, but LocationProvider causes permanent wakelock, so it's turned off)
- Power Profile
- Power HAL
- Flashlight
- Audio: headset
- MTP/PTP
- Tethering (Wi-Fi nor USB)
- Hardware codecs
- Camera
- Bluetooth

Known issues:
- Audio: speakerphone is too quiet
- Audio: microphone is too quiet too
- WebView causes some apps (like ForPDA) to crash
- CPU Governors could not be changed through builtin settings due to file chmods