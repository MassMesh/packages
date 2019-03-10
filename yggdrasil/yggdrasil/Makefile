include $(TOPDIR)/rules.mk

PKG_NAME:=yggdrasil
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/yggdrasil-network/yggdrasil-go.git
PKG_SOURCE_VERSION:=develop
PKG_LICENSE:=GPL-3.0
PKG_MAINTAINER:=William Fleurant <meshnet@protonmail.com>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/yggdrasil
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=Yggdrasil supports end-to-end encrypted IPv6 networks
  URL:=https://yggdrasil-network.github.io/
  DEPENDS:=$(GO_ARCH_DEPENDS)
  PKGARCH:=all
endef

define Package/yggdrasil/description
Yggdrasil is an early-stage implementation of a fully end-to-end encrypted IPv6 network.
It is lightweight, self-arranging, supported on multiple platforms and allows pretty much
any IPv6-capable application to communicate securely with other Yggdrasil nodes.
Yggdrasil does not require you to have IPv6 Internet connectivity - it also works over IPv4.
Although Yggdrasil shares many similarities with cjdns, it employs a different routing
algorithm based on a globally-agreed spanning tree and greedy routing in a metric space,
and aims to implement some novel local backpressure routing techniques. In theory, Yggdrasil
should scale well on networks with internet-like topologies.
endef


## wip: hardcoded to mips
define Build/Compile
	cd $(PKG_BUILD_DIR) && \
    go env && \
	GOOS="linux" GOARCH="mips" PKGVER="0.3.3-openwrt" $(PKG_BUILD_DIR)/build
endef

define Package/yggdrasil/install
	$(INSTALL_DIR) $(1)/usr/sbin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/yggdrasil \
		$(1)/usr/sbin

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/yggdrasilctl \
		$(1)/usr/sbin

endef


$(eval $(call BuildPackage,yggdrasil))




