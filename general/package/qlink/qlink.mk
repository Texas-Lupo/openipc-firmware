################################################################################
#
# qlink
#
################################################################################

# Use the specific commit hash or branch name (e.g., master)
QLINK_VERSION = 5a4f48cf5b726a53b343f06f00f30e004309d59d
QLINK_SITE = $(call github,Vulpisfoglia-dev,QLink,$(QLINK_VERSION))

QLINK_LICENSE = GPL-3.0
QLINK_LICENSE_FILES = LICENSE

# TARGET_CONFIGURE_OPTS automatically passes the correct ARM cross-compiler, 
# as well as the -Os, -mcpu, and -mfloat-abi flags defined in your defconfig.
define QLINK_BUILD_CMDS
	@echo "Building QLink for ARM target"
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

# Installs the compiled binary into the drone's /usr/bin directory and makes it executable
define QLINK_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/qlink $(TARGET_DIR)/usr/bin/qlink
endef

$(eval $(generic-package))
