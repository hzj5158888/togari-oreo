# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform path
PLATFORM_COMMON_PATH := device/sony/rhine

# Only build bootimg
TARGET_BOOTIMG_SIGNED := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm8974
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

TARGET_KERNEL_VERSION := 3.10

#ENABLE_CPUSETS := true

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
BOARD_KERNEL_CMDLINE += vmalloc=300M

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

BOARD_KERNEL_IMAGE_NAME := zImage-dtb

TARGET_KERNEL_SOURCE 	:= kernel/sony/msm

KERNEL_TOOLCHAIN        := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

TARGET_COMPILE_WITH_MSM_KERNEL := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2436890624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12891143680
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RECOVERY_FSTAB = $(PLATFORM_COMMON_PATH)/rootdir/fstab.rhine

# Wi-Fi definitions for Qualcomm solution
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WPA_SUPPLICANT_VERSION		 := VER_0_8_X

# Audio
QCOM_CSDCLIENT_ENABLED := false
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
TARGET_USES_QCOM_MM_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 0
USE_XML_AUDIO_POLICY_CONF := 1

# BT definitions for Qualcomm solution
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# FM definitions for Qualcomm solution
BOARD_HAVE_ALTERNATE_FM := true
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Fixes Wifi-Mobile Data toggle issue
MALLOC_SVELTE := true

# Power
TARGET_USES_INTERACTION_BOOST := true

# Nfc
BOARD_NFC_CHIPSET := pn544

# Egl
BOARD_EGL_CFG := $(PLATFORM_COMMON_PATH)/rootdir/system/etc/egl.cfg

# Init
#TARGET_INIT_VENDOR_LIB := libinit_rhine

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE := $(PLATFORM_COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE   := $(PLATFORM_COMMON_PATH)/compatibility_matrix.xml

# SELinux
#BOARD_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy_platform

include device/sony/common/CommonConfig.mk
