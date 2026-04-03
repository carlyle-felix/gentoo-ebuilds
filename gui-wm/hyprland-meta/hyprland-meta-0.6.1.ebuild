# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Hyprland metapackage"
HOMEPAGE="https://github.com/carlyle-felix"
LICENSE="metapackage"
SLOT="0"
IUSE="+networkmanager"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	app-misc/brightnessctl
	gui-apps/hypridle
	gui-apps/hyprlauncher
	gui-apps/hyprlock
	gui-apps/hyprpaper
	gui-apps/hyprpicker
	gui-apps/hyprshot
	gui-apps/mako
	gui-apps/waybar[mpris,pipewire,tray,wifi,network,backlight]
	gui-apps/wl-clipboard
	gui-apps/hyprshutdown
	gui-libs/xdg-desktop-portal-hyprland
	gui-wm/hyprland
	networkmanager? ( net-misc/networkmanager )
	media-fonts/nerdfonts
	media-fonts/noto
	media-fonts/noto-emoji
	sys-apps/xdg-desktop-portal-gtk
	sys-auth/hyprpolkitagent
	sys-auth/rtkit
	sys-power/power-profiles-daemon
	sys-process/htop[lm-sensors]
	x11-misc/xdg-user-dirs-gtk
	x11-terms/kitty
"
