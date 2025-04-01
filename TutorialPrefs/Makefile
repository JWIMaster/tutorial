TARGET := iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TutorialPrefs

TutorialPrefs_FILES = JWIRootListController.m
TutorialPrefs_FRAMEWORKS = UIKit
TutorialPrefs_PRIVATE_FRAMEWORKS = Preferences
TutorialPrefs_INSTALL_PATH = /Library/PreferenceBundles
TutorialPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
