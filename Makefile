TARGET := iphone:clang:latest:14.0
ARCHS = arm64
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = tutorial

tutorial_FILES = Tweak.x
tutorial_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += TutorialPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
