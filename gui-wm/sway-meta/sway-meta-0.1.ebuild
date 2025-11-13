# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Swaywm config metapackage"
HOMEPAGE="https://github.com/carlyle-felix"
LICENSE="metapackage"
SLOT="0"
IUSE="+networkmanager"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	app-misc/brightnessctl
	gui-apps/grim
	gui-apps/mako
	gui-apps/swayidle
	gui-apps/swaylock
	gui-apps/waybar[mpris,pipewire,tray,wifi]
	gui-apps/wofi
	gui-libs/xdg-desktop-portal-wlr
	gui-wm/sway[-swaybar,wallpapers]
	networkmanager? ( net-misc/networkmanager )
	media-fonts/fontawesome
	media-fonts/nerdfonts
	sys-apps/xdg-desktop-portal-gtk
	sys-auth/rtkit
	sys-power/power-profiles-daemon
	sys-process/htop[lm-sensors]
	x11-libs/libnotify
	x11-misc/xdg-user-dirs-gtk
	x11-terms/kitty
	x11-themes/catppuccin-cursors
	x11-themes/papirus-icon-theme
"
