# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/raoulh/moolticute.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/raoulh/moolticute/archive/v${PV}-beta.tar.gz -> moolticute-${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm"
fi

inherit qmake-utils udev

DESCRIPTION="Mooltipass crossplatform daemon/tools "
HOMEPAGE="https://github.com/raoulh/moolticute"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=dev-qt/qtcore-5.6:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qttest:5
	dev-qt/qtwebsockets:5
	dev-qt/qtwidgets:5
	>=dev-libs/libusb-1.0.20"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake5 PREFIX="/usr" Moolticute.pro
}

src_install() {
	emake install INSTALL_ROOT="${D}"

	udev_dorules ${FILESDIR}/50-mooltipass.rule
	doinitd ${FILESDIR}/moolticuted.init
}

pkg_postinst() {
	udev_reload
}
