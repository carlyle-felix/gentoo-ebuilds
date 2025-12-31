# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hyprland GUI utilities (successor to hyprland-qtutils)"
HOMEPAGE="https://github.com/hyprwm/hyprland-guiutils"
SRC_URI="https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"

SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-libs/hyprlang-0.6.0
	>=gui-libs/hyprutils-0.2.4
	>=gui-libs/hyprtoolkit-0.2.2
	x11-libs/pixman
	x11-libs/libdrm
"

DEPEND="${RDEPEND}"
