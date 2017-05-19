# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/raoulh/moolticute.git"
	inherit git-r3
	KEYWORDS=""
	S=${WORKDIR}/${P}/${PN}
else
	SRC_URI="https://github.com/raoulh/moolticute/archive/v${PV}-beta.tar.gz -> moolticute-${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm"
	S=${WORKDIR}/${P}-beta
fi

inherit qmake-utils

DESCRIPTION="Mooltipass crossplatform daemon/tools "
HOMEPAGE="https://github.com/raoulh/moolticute"

LICENSE="CLOSED"
SLOT="0"
IUSE=""

RDEPEND=">=dev-qt/qtcore-5.6
	dev-qt/qtwidgets
	dev-qt/qtgui
	dev-qt/qtnetwork
	dev-qt/qtwebsockets
	virtual/libusb"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake5 PREFIX="/usr" Moolticute.pro
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
