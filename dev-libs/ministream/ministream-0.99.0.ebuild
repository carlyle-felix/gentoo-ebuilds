# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="ministream"
HOMEPAGE="https://gitlab.gnome.org/sp1rit/ministream"
SRC_URI="https://gitlab.gnome.org/sp1rit/${PN}/-/archive/${PV}/${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="1"
KEYWORDS="~amd64 ~arm64"
IUSE="+introspection"
REQUIRED_USE="
	introspection
"

RDEPEND="
	>=dev-libs/glib-2.80.0:2
	>=gui-libs/gtk-4.19.4:4[introspection?]
	>=dev-libs/gobject-introspection-1.83.2
"
DEPEND="${RDEPEND}
"

src_configure() {
	local emesonargs=(
		$(meson_feature introspection)
	)
	meson_src_configure
}