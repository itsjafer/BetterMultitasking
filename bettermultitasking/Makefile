ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = bettermultitasking

bettermultitasking_FILES = BMTRootListController.m
bettermultitasking_INSTALL_PATH = /Library/PreferenceBundles
bettermultitasking_FRAMEWORKS = UIKit
bettermultitasking_PRIVATE_FRAMEWORKS = Preferences
bettermultitasking_CFLAGS = -fobjc-arc
bettermultitasking_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/bettermultitasking.plist$(ECHO_END)
