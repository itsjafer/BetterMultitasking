ARCHS = arm64e arm64
THEOS_DEVICE_IP = 10.0.0.59
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BetterMultitasking

BetterMultitasking_FILES = tweak.xm
BetterMultitasking_CFLAGS = -fobjc-arc
BetterMultitasking_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += bettermultitasking
include $(THEOS_MAKE_PATH)/aggregate.mk
