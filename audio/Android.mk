ifeq ($(TARGET_PROVIDES_LIBAUDIO),true)
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)

AUDIO_HW_ROOT := $(call my-dir)
include $(AUDIO_HW_ROOT)/msm7627a/Android.mk

endif
endif
