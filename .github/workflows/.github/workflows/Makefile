ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WWH_Hack
WWH_Hack_FILES = Tweak.xm
WWH_Hack_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
