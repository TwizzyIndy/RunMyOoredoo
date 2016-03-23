include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RunMyOoredooPref
RunMyOoredooPref_FILES = RMORootListController.m
RunMyOoredooPref_INSTALL_PATH = /Library/PreferenceBundles
RunMyOoredooPref_FRAMEWORKS = UIKit
RunMyOoredooPref_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RunMyOoredooPref.plist$(ECHO_END)
