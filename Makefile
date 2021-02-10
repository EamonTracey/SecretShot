ARCHS = arm64 arm64e

TARGET := iphone:clang:13.7:13.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

INSTALL_TARGET_PROCESSES = Snapchat

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SecretShot

SecretShot_FILES = $(shell find Logos -name "*.x")
SecretShot_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS = SecretShotPreferences
include $(THEOS_MAKE_PATH)/aggregate.mk