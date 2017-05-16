# inherit from the proprietary version
#-include vendor/samsung/delos3geur/BoardConfigVendor.mk

#by wiki.cyanogenmod.org
TARGET_ARCH := arm
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5573804032
BOARD_HAS_NO_SELECT_BUTTON := true
# we should pass this argument to the kernel on QCOM boards
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom
# it seems to be unneccessary, but the first fine is for Android <= 4.1, second is for 4.2+
#BOARD_FORCE_RAMDISK_ADDRESS := 0x01300000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01300000 # 4.2+

# Kernel binary and sources
TARGET_PREBUILT_KERNEL := device/samsung/delos3geur/kernel_mtp
# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/samsung/delos3geur
# Kernel config file from $(TARGET_KERNEL_SOURCE)/arch/arm/config
TARGET_KERNEL_CONFIG := cm10_delos3geur_defconfig

TARGET_BOARD_PLATFORM := msm7x27a # fixed
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a5
TARGET_BOOTLOADER_BOARD_NAME := msm8625

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp

ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CORTEX_CACHE_LINE_32 := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# force QCOM BSP and compilation for QCOM hardware (is this neccessary to do there?)
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP -DQCOM_HARDWARE

# include QCOM BSP too
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

# this is for ALSA sound. exists in:
# frameworks/av/media/libstagefright/LPAPlayerALSA.cpp
# hardware/qcom/audio-caf/alsa_sound/AudioSessionOut.cpp
# if we do not define it there, default value is 256
#COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480

# missing, custom and overlay includes are taken from there.
TARGET_SPECIFIC_HEADER_PATH := device/samsung/delos3geur/include

##### TWEAKING GRAPHICS #####
# build from hardware/qcom/display-legacy
TARGET_QCOM_DISPLAY_VARIANT := legacy
# Grace5921 said that i8552 kernel supports ION. Believe him.
TARGET_USES_ION := true
# msm7x27a does not support H/W vsync
TARGET_NO_HW_VSYNC := true
# somewhat optimization?
ARCH_ARM_HAVE_NEON := true
TARGET_GRALLOC_USES_ASHMEM := true
# use stock lights.msm7x27a?
TARGET_PROVIDES_LIBLIGHT := true

# EGL config. all graphics built on top of the EGL, so without this system will become unbootable.
BOARD_EGL_CFG := device/samsung/delos3geur/egl.cfg

USE_OPENGL_RENDERER := true
TARGET_DOESNT_USE_FENCE_SYNC := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_NEEDS_LEGACY_FB := true

COMMON_GLOBAL_CFLAGS += -DNO_TUNNEL_RECORDING

TARGET_DISPLAY_USE_RETIRE_FENCE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USE_MHEAP_SCREENSHOT := true

BOARD_EGL_WORKAROUND_BUG_10194508 := true
HWUI_COMPILE_FOR_PERF := true


##### TWEAKING AUDIO #####
TARGET_PROVIDES_LIBAUDIO := true
# allow usage of old 4.0.3 audio binaries. found manually in AudioFlinger.cpp
# could not find:
#AUDIO_DEVICE_IN_ANC_HEADSET
#AUDIO_DEVICE_IN_PROXY
#COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB
#COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB

#TARGET_QCOM_AUDIO_VARIANT := caf
# build audio HAL from device tree
TARGET_QCOM_AUDIO_VARIANT := custom
#BOARD_USES_AUDIO_LEGACY := false
# use Grace5921 audio HAL with libaudcal
TARGET_HAS_QACT := true

##### TWEAKING MEDIA #####
TARGET_QCOM_MEDIA_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_MMPARSE
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
ARCH_ARM_HAVE_ARMV7A := true

TARGET_BOARD_PLATFORM_GPU := qcom-adreno203
BOARD_USES_ADRENO_200 := true

BOARD_USE_LEGACY_UI := true

# Samsung has weird framebuffer
TARGET_NO_INITLOGO := true
DEVICE_RESOLUTION := 480x800
#BOARD_KERNEL_BASE := 0x00200000

# tweaking power
#TARGET_POWERHAL_VARIANT :=

# tweaking RIL by weritos
# if true, use libril from device tree or somewhere else, NOT from hardware/ril
#BOARD_PROVIDES_LIBRIL := true
#BOARD_RIL_CLASS := ../../../device/samsung/delos3geur/ril/java_ril
COMMON_GLOBAL_CFLAGS += -DRIL_SUPPORTS_SEEK
COMMON_GLOBAL_CFLAGS += -DRIL_VARIANT_LEGACY 

# Wi-Fi by weritos
BOARD_WLAN_DEVICE := ath6kl
# seems to be unsupported on cm10.x; wifi.c is from libhardware_legacy
#TARGET_CUSTOM_WIFI := device/samsung/delos3geur/wifi/wifi.c
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WIFI_DRIVER_IFACE_NAME := "wlan0"
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
WIFI_EXT_MODULE_NAME := "cfg80211"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
WIFI_DRIVER_MODULE_AP_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
WIFI_DRIVER_MODULE_NAME := "ath6kl_sdio"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fwpath"

# GPS by weritos
#QCOM_GPS_PATH := hardware/qcom/gps
# if true, use gps from device tree or somewhere else, NOT from hardware/qcom/gps
#TARGET_PROVIDES_GPS_LOC_API := true
#BOARD_USES_QCOM_LIBRPC := true
#BOARD_USES_QCOM_GPS := true
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50001
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM) 

# Filesystem (partitions) on eMMC
#BOARD_VOLD_MAX_PARTITIONS := 32
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p21
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p22
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw
BOARD_DATA_DEVICE := /dev/block/mmcblk0p24
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw

BOARD_CACHEIMAGE_PARTITION_SIZE := 41943040
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_WANTS_EMMC_BOOT := true # we can't boot without rmt_storage anyway

# maybe this will help?
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
USE_CAMERA_STUB := true
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_QCOM_FM := false

#BOARD_USE_LEGACY_TOUCHSCREEN := true

DISABLE_DEXPREOPT := true

# we need only system, data (built anyway) and boot images
TARGET_NO_BOOTLOADER := true # Samsung has their own bootloader
TARGET_NO_RADIOIMAGE := true # and own radio firmware
#TARGET_NO_RECOVERY := true   # I use TWRP, but without this ota_from_target_files fails
#TARGET_NO_BOOTIMAGE := true # boot.img
