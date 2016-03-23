include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RunMyOoredoo
RunMyOoredoo_FILES = RunMyOoredoo.xm
RunMyOoredoo_FRAMEWORKS = UIKit Foundation
RunMyOoredoo_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk


SUBPROJECTS += runmyooredoopref
include $(THEOS_MAKE_PATH)/aggregate.mk
