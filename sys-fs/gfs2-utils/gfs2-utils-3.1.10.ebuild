# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools linux-info

DESCRIPTION="GFS2 Utilities"
HOMEPAGE="https://sourceware.org/cluster/gfs/"
SRC_URI="https://releases.pagure.org/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND="sys-cluster/corosync
	sys-cluster/openais
	sys-cluster/liblogthread
	sys-cluster/libccs
	sys-cluster/libfence
	sys-cluster/libdlm
	sys-libs/ncurses:0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${P}"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf \
		$(use_enable debug) \
		--localstatedir=/var
}

src_compile() {
	# parallel build is broken
	emake -j1
}

src_install() {
	default
	rm -rf "${D}/usr/share/doc"
	dodoc doc/*.txt

	keepdir /var/{lib,log}/cluster
}
