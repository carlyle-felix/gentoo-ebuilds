# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A helper library to generate run-time configuration for the Raspberry Pi ISP (PiSP)"
HOMEPAGE="https://github.com/raspberrypi/libpisp"
SRC_URI="https://github.com/raspberrypi/libpisp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~arm64"

LICENSE="LGPL-2.1+"
SLOT="0"

RDEPEND="
   dev-cpp/nlohmann_json
"
src_configure() {
   meson_src_configure
}