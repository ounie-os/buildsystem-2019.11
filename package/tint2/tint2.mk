################################################################################
#
# tint2
#
################################################################################

TINT2_VERSION = v16.7
TINT2_SOURCE = tint2-$(TINT2_VERSION).tar.bz2
TINT2_SITE = https://gitlab.com/o9000/tint2/-/archive/$(TINT2_VERSION)/tint2-$(TINT2_VERSION).tar.bz2
TINT2_LICENSE = GPL-2.0
TINT2_DEPENDENCIES = xlib_libX11 xlib_libXcomposite xlib_libXdamage xlib_libXinerama xlib_libXext xlib_libXrender xlib_libXrandr
TINT2_DEPENDENCIES += pango cairo libglib2 imlib2 librsvg startup-notification

$(eval $(cmake-package))
