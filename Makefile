FINALPACKAGE=1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FocusKiller

FocusKiller_FILES = Tweak.x
FocusKiller_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
