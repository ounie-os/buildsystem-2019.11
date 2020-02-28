################################################################################
#
# rtl8192cu
#
################################################################################

RTL8192CU_VERSION = 7f3873c606f8afadcd18617897b8001dbb9dcc1f
RTL8192CU_SITE = $(call github,ounie-os,rtlwifi-8192cu,$(RTL8192CU_VERSION))
RTL8192CU_LICENSE = GPL-2.0
RTL8192CU_LICENSE_FILES = LICENSE

RTL8192CU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8192CU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
