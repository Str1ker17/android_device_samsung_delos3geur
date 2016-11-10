$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/delos3geur/delos3geur-vendor.mk)

LOCAL_PATH := device/samsung/delos3geur

PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_CONFIG := mdpi hdpi

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
	
# list from 4.4.4 by weritos
PRODUCT_COPY_FILES += frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml
#PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
#PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Display
# copybit, gralloc, hwcomposer, lights: hardware/qcom/display
# libmm-omxcore, libOmxCore: hardware/qcom/media
PRODUCT_PACKAGES += libgenlock
PRODUCT_PACKAGES += gralloc.msm7x27a
PRODUCT_PACKAGES += copybit.msm7x27a
PRODUCT_PACKAGES += lights.msm7x27a
PRODUCT_PACKAGES += libtilerenderer
PRODUCT_PACKAGES += memtrack.msm7x27a
PRODUCT_PACKAGES += hwcomposer.msm7x27a
PRODUCT_PACKAGES += libmm-omxcore
PRODUCT_PACKAGES += libOmxCore
#PRODUCT_PACKAGES += libqdutils
#PRODUCT_PACKAGES += librs_jni
PRODUCT_PACKAGES += libcnefeatureconfig
PRODUCT_PACKAGES += libnl_2
#PRODUCT_PACKAGES += libstagefrighthw
#PRODUCT_PACKAGES += libdashplayer
#PRODUCT_PACKAGES += libI420colorconvert 
	
# Audio
# audio.primary, audio_policy: hardware/qcom/audio || device/samsung/delos3geur/audio
PRODUCT_PACKAGES += audio.primary.msm7x27a
PRODUCT_PACKAGES += audio_policy.msm7x27a
PRODUCT_PACKAGES += audio.a2dp.default
PRODUCT_PACKAGES += audio.usb.default
PRODUCT_PACKAGES += libaudioutils
#PRODUCT_PACKAGES += libaudiohw_legacy

# GPS (disabled)
#PRODUCT_PACKAGES += gps.msm7x27a
# no rule to make target
#PRODUCT_PACKAGES += libgps.utils
# no rule to make target
#PRODUCT_PACKAGES += libloc_adapter
# no rule to make target
#PRODUCT_PACKAGES += libloc_eng
# cm11
#PRODUCT_PACKAGES += libloc_api-rpc-qc
PRODUCT_PACKAGES += libloc_api-rpc

# Misc
#PRODUCT_PACKAGES += power.msm7x27a
#PRODUCT_PACKAGES += libnetutils # no need
PRODUCT_PACKAGES += libnetmgr

# Java applications
PRODUCT_PACKAGES +=	Torch
	
# proprietary files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/system,system)

# files for boot.img
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/ramdisk,root)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.secure=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.debuggable=1

#include $(call all-makefiles-under, hardware/qcom)
#$(call inherit-product, hardware/qcom/display/Android.mk)
#$(call inherit-product, hardware/qcom/media/Android.mk)
#$(call inherit-product, hardware/qcom/audio/Android.mk)
#$(call inherit-product, hardware/qcom/gps/loc_api/Android.mk)

TARGET_OTA_ASSERT_DEVICE :=
# Actually build
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_delos3geur
PRODUCT_DEVICE := delos3geur
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I8552