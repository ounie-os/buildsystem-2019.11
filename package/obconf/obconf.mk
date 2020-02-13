################################################################################
#
# obconf
#
################################################################################

OBCONF_VERSION = 2.0.4
OBCONF_SOURCE = obconf-$(OBCONF_VERSION).tar.gz
OBCONF_SITE = http://openbox.org/dist/obconf
OBCONF_DEPENDENCIES = libgtk2 libglade openbox host-pkgconf
OBCONF_LICENSE = GPL-2.0
OBCONF_LICENSE_FILES = COPYING
OBCONF_CONF_OPTS += PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

$(eval $(autotools-package))
