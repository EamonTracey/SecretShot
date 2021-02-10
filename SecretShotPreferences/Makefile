ARCHS = arm64 arm64e

TARGET := iphone:clang:13.7:13.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SecretShotPreferences

SecretShotPreferences_FILES = $(shell find Sources/SecretShotPreferences -name "*.swift") $(shell find Sources/SecretShotPreferencesC -name "*.m")
SecretShotPreferences_INSTALL_PATH = /Library/PreferenceBundles
SecretShotPreferences_SWIFTFLAGS = -ISources/SecretShotPreferencesC/include
SecretShotPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk