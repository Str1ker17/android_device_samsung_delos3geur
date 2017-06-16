# thanks Grace5921
ifeq ($(TARGET_QCOM_AUDIO_VARIANT),custom)
AUDIO_HAL_PATH := $(call my-dir)
include $(AUDIO_HAL_PATH)/audio_hal/Android.mk
include $(AUDIO_HAL_PATH)/policy_hal/Android.mk
endif
