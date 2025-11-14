# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hyprland graphics / resource utilities"
HOMEPAGE="https://github.com/hyprwm/hyprgraphics"
SRC_URI="https://github.com/hyprwm/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	x11-libs/pixman
	x11-libs/cairo
	gui-libs/hyprutils
	media-libs/libjpeg-turbo
	media-libs/libjxl:=
	media-libs/libspng
	media-libs/libwebp:=
	sys-apps/file
	gnome-base/librsvg:2
"
DEPEND="${RDEPEND}"
