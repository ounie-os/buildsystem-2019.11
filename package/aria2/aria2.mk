################################################################################
#
# aria2
#
################################################################################

ARIA2_VERSION = 1.35.0
ARIA2_SOURCE = aria2-$(ARIA2_VERSION).tar.xz
ARIA2_SITE = https://github.com/aria2/aria2/releases/download/release-$(ARIA2_VERSION)/aria2-$(ARIA2_VERSION).tar.xz
ARIA2_DEPENDENCIES = host-pkgconf openssl libopenssl zlib libxml2 c-ares
ARIA2_LICENSE = GPL-2.0 with OpenSSL exception
ARIA2_LICENSE_FILES = COPYING

define ARIA2_INSTALL_CONFIG_FILE
	mkdir -p $(TARGET_DIR)/etc/aria2/
	$(INSTALL) -m 0755 -D package/aria2/aria2.conf $(TARGET_DIR)/etc/aria2/
	[ -d $(TARGET_DIR)/etc/init.d/ ] || mkdir -p $(TARGET_DIR)/etc/init.d/
	$(INSTALL) -m 0755 -D package/aria2/S95aria2 $(TARGET_DIR)/etc/init.d/
endef

ARIA2_POST_INSTALL_TARGET_HOOKS += ARIA2_INSTALL_CONFIG_FILE

$(eval $(autotools-package))