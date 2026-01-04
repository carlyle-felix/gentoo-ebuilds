# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils meson xdg

DESCRIPTION="Bazaar is a new app store for GNOME with a focus on
discovering and installing applications and add-ons from Flatpak
remotes, particularly Flathub."
HOMEPAGE="https://github.com/kolunmi/bazaar"
SRC_URI="https://github.com/kolunmi/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="+flatpak"

RDEPEND="
    gui-libs/gtk:4
    >=gui-libs/libadwaita-1.8
    >=dev-libs/libdex-1.0.0
    flatpak? ( >=sys-apps/flatpak-1.9 )
    >=dev-libs/appstream-1.0
    >=dev-libs/libxmlb-0.3.4
    >=media-libs/glycin-2.0
    >=dev-libs/libyaml-0.2.5
    >=net-libs/libsoup-3.6.5:3.0
    >=dev-libs/json-glib-1.10.0
    >=dev-libs/md4c-0.5.1
    >=net-libs/webkit-gtk-2.50.2:6
    app-crypt/libsecret
"

DEPEND="${RDEPEND}
"

BDEPEND="
    dev-util/gdbus-codegen
    dev-util/blueprint-compiler
"

src_configure() {
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}