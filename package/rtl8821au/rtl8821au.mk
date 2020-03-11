################################################################################
#
# rtl8821au
#
################################################################################

RTL8821AU_VERSION = 125ab94907b9a4ccb2553d296d3fe2a06d41a6c7
RTL8821AU_SITE = $(call github,ounie-os,rtl8821au,$(RTL8821AU_VERSION))
RTL8821AU_LICENSE = GPL-2.0
RTL8821AU_LICENSE_FILES = LICENSE

RTL8821AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8821AU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
