# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson xdg

DESCRIPTION="libgsystemservice is a utility library providing common components needed for
building system services to be exposed on the D-Bus system bus"
HOMEPAGE="https://gitlab.gnome.org/pwithnall/libgsystemservice"
SRC_URI="https://gitlab.gnome.org/pwithnall/libgsystemservice/-/archive/${PV}/${PN}-${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-libs/glib-2.54
	sys-auth/polkit
	sys-apps/systemd
"
DEPEND="${RDEPEND}"

pkg_postinst() {
	xdg_pkg_postinst
}

pkg_postrm() {
	xdg_pkg_postrm
}