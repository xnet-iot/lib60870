#
# This software is licensed under the Public Domain.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lib60870
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/$(PKG_NAME)
	SECTION:=niseva
	CATEGORY:=xNet
	SUBMENU:=IEC60870
	TITLE:=xNet IEC60870 Library
	DEPENDS:=
	URL:=https://www.niseva.com
endef

define Package/$(PKG_NAME)/description
	xNet IEC60870 Library
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./lib60870-C/. $(PKG_BUILD_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
		$(CP) $(PKG_INSTALL_DIR)/usr/include/lib60870/ $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblib60870.a* $(1)/usr/lib/
endef

define Package/$(PKG_NAME)/install
 	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblib60870.a* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
