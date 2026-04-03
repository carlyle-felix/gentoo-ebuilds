# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A complex camera support library for Linux, Android, and ChromeOS"
HOMEPAGE="https://libcamera.org/"

MYP="rpt20260205"
SRC_URI="https://github.com/raspberrypi/libcamera/archive/refs/tags/v${PV}+${MYP}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~arm64"

LICENSE="LGPL-2.1+"
SLOT="0"

IUSE="debug drm gnutls gstreamer jpeg libevent qt6 sdl tiff trace udev unwind v4l2"
REQUIRED_USE="qt6? ( tiff )"

S="${WORKDIR}/libcamera-${PV}-${MYP}"

DEPEND="
   dev-libs/libyaml:=
   dev-python/jinja2
   dev-python/ply
   dev-python/pyyaml
   || (
      net-libs/gnutls
      dev-libs/openssl
   )
   debug? ( dev-libs/elfutils:= )
   gstreamer? ( media-libs/gstreamer:= )
   libevent?
   (
      dev-libs/libevent:=
      drm? ( x11-libs/libdrm:= )
      jpeg? ( media-libs/libjpeg-turbo:= )
      sdl? ( media-libs/libsdl2:= )
   )
   qt6?
   (
      dev-qt/qtbase
      dev-qt/qtwidgets:6
   )
   tiff? ( media-libs/tiff:= )
   trace? ( dev-util/lttng-ust:= )
   udev? ( virtual/libudev:= )
   unwind? ( sys-libs/libunwind:= )
"
RDEPEND="
   ${DEPEND}
   media-libs/libpisp
   trace? ( dev-util/lttng-tools )
"

src_configure() {
   local emesonargs=(
      -Ddocumentation=disabled
      $(meson_feature libevent cam)
      $(meson_feature gstreamer)
      $(meson_feature qt6 qcam)
      $(meson_feature trace tracing)
      $(meson_feature v4l2)
      -Dipas=rpi/vc4,rpi/pisp,simple
      -Dpipelines=uvcvideo,ipu3,simple,rpi/vc4,rpi/pisp
   )

   meson_src_configure
}