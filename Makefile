ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.0
ADDITIONAL_OBJCFLAGS = -fobjc-arc
# PACKAGE_VERSION = 1.5.1
# DEBUG = 1

include $(THEOS)/makefiles/common.mk

SOURCE_FILES=$(wildcard source/*.m source/*.mm source/*.x source/*.xm)

TWEAK_NAME = PriorityHub
PriorityHub_FILES = $(SOURCE_FILES)
PriorityHub_FRAMEWORKS = UIKit CoreGraphics CoreTelephony QuartzCore
PriorityHub_PRIVATE_FRAMEWORKS = IMAVCore
PriorityHub_CFLAGS = -include source/Prefix.pch

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += preferences
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
