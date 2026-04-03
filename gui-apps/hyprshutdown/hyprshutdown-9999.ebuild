# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="A graceful shutdown/logout utility for Hyprland"
HOMEPAGE="https://github.com/hyprwm/hyprshutdown"
EGIT_REPO_URI="https://github.com/hyprwm/${PN^}.git"

LICENSE="BSD"
SLOT="0"

RDEPEND="
	gui-libs/hyprtoolkit
	>=gui-libs/hyprutils-0.11.0
	x11-libs/pixman
	x11-libs/libdrm
"
DEPEND="
	${RDEPEND}
	dev-cpp/glaze
"
BDEPEND="
"
