################################################################################
#
# python-bbb-gpio
#
################################################################################
PYTHON_BBB_GPIO_VERSION = 1.1.1
PYTHON_BBB_GPIO_SOURCE = Adafruit_BBIO-$(PYTHON_BBB_GPIO_VERSION).tar.gz
PYTHON_BBB_GPIO_SITE = https://files.pythonhosted.org/packages/53/2b/b0e3dce6113225aae9beb886b2addd4fd5c140ba93c9503d7e4a97021bcc
PYTHON_BBB_GPIO_LICENSE = MIT
PYTHON_BBB_GPIO_LICENSE_FILES = LICENCE.txt
PYTHON_BBB_GPIO_SETUP_TYPE = distutils

$(eval $(python-package))
