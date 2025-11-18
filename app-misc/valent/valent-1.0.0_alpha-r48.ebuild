# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils meson xdg vala

DESCRIPTION="Connect, Control and Sync Devices"
HOMEPAGE="https://github.com/andyholmes/valent"
SRC_URI="https://github.com/andyholmes/${PN}/releases/download/v1.0.0.alpha.48/${PN}-1.0.0.alpha.48.tar.xz"

S=${WORKDIR}/${PN}-1.0.0.alpha.48

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="pulseaudio"

RDEPEND="
    >=dev-libs/glib-2.80.0
    >=gui-libs/gtk-4.15.2
    >=media-libs/glycin-2.0.1
    >=net-libs/gnutls-3.1.3
    >=dev-libs/json-glib-1.6.0
    >=dev-libs/libpeas-2.0.0[vala]
    >=gnome-extra/evolution-data-server-3.48[vala]
    >=gui-libs/libadwaita-1.6
    >=dev-libs/libportal-0.7.1
    >=app-misc/tinysparql-3.0[vala]
    app-text/libebook[tools]
    dev-libs/libphonenumber
"

DEPEND="${RDEPEND}
"

BDEPEND="
    dev-util/gdbus-codegen
    dev-util/blueprint-compiler
"

src_prepare() {
    default
    vala_setup
}

src_configure() {
	local emesonargs=(
	$(meson_use pulseaudio plugin_pulseaudio)
)
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
