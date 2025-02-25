#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6150-common
include device/xiaomi/sm6150-common/BoardConfigCommon.mk

# Inherit from proprietary files for miuicamera
-include vendor/xiaomi/sweet-miuicamera/products/board.mk

DEVICE_PATH := device/xiaomi/sweet

# Assert
TARGET_OTA_ASSERT_DEVICE := sweet,sweetin

# Audio
TARGET_PROVIDES_AUDIO_EXTNS := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/device_framework_compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest.xml
ODM_MANIFEST_SKUS += sweet
ODM_MANIFEST_SWEET_FILES := \
    $(DEVICE_PATH)/configs/hidl/manifest-nfc.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_sweet
TARGET_RECOVERY_DEVICE_MODULES := libinit_sweet

# Kernel
TARGET_KERNEL_CONFIG += vendor/sweet.config

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114980532224

BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # (BOARD_SUPER_PARTITION_SIZE - 4194304) 4MiB overhead

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Screen density
TARGET_SCREEN_DENSITY := 440

# Sepolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2023-10-01

# Inherit from proprietary files
include vendor/xiaomi/sweet/BoardConfigVendor.mk
