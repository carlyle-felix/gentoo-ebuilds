# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="libcamera-based applications to drive the cameras on a Raspberry Pi platform"
HOMEPAGE="https://github.com/raspberrypi/rpicam-apps"
SRC_URI="https://github.com/raspberrypi/rpicam-apps/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~arm64"

LICENSE="BSD-2"
SLOT="0"

IUSE="drm egl ffmpeg opencv qt6"

DEPEND="
   dev-libs/boost:=
   media-libs/rpi-libcamera
   media-libs/libexif:=
   media-libs/libjpeg-turbo:=
   media-libs/libpng:=
   media-libs/tiff:=
   drm? ( x11-libs/libdrm:= )
   egl? ( media-libs/libepoxy:= )
   ffmpeg? ( media-video/ffmpeg:= )
   opencv? ( media-libs/opencv:= )
   qt6? (
      dev-qt/qtbase
      dev-qt/qtwidgets:6
   )
"
RDEPEND="${DEPEND}"
BDEPEND="
   virtual/pkgconfig
"

src_configure() {
   local emesonargs=(
      $(meson_feature drm enable_drm)
      $(meson_feature ffmpeg enable_libav)
      $(meson_feature opencv enable_opencv)
      $(meson_feature qt6 enable_qt)
      -Denable_egl=enabled
      -Denable_tflite=disabled
      -Denable_hailo=disabled
   )
   meson_src_configure
}