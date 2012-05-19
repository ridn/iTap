ifeq ($(shell [ -f ./framework/makefiles/common.mk ] && echo 1 || echo 0),0)
all clean package install::
	git submodule update --init
	./framework/git-submodule-recur.sh init
	$(MAKE) $(MAKEFLAGS) MAKELEVEL=0 $@
else
TWEAK_NAME = iTap
iTap_FILES = Tweak.x
iTap_FRAMEWORKS = CoreFoundation Foundation UIKit CoreGraphics QuartzCore

TARGET_IPHONEOS_DEPLOYMENT_VERSION = 5.0
SDKVERSION=4.2

include theos/makefiles/common.mk
include theos/makefiles/tweak.mk

endif
