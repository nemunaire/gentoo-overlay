# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit systemd user

EGO_PN="github.com/documize/community"
KEYWORDS="-* ~amd64 ~arm ~arm64"

DESCRIPTION="Open source Confluence alternative built with Golang + EmberJS"
HOMEPAGE="https://www.documize.com/"
SRC_URI="
	arm64? ( https://github.com/documize/community/releases/download/v3.2.0/documize-community-linux-arm64 -> ${PN}_arm64-${PV} )
	arm? ( https://github.com/documize/community/releases/download/v3.2.0/documize-community-linux-arm -> ${PN}_arm-${PV} )
	amd64? ( https://github.com/documize/community/releases/download/v3.2.0/documize-community-linux-amd64 -> ${PN}_amd64-${PV} )
"

LICENSE="AGPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="virtual/mysql"

src_unpack() {
	mkdir "${S}"
	cp "${DISTDIR}/${A}" ${S}/documize
}

src_install() {
	dobin documize

	diropts -m0750 -o nobody -g nobody
	keepdir /var/log/documize /var/lib/documize
	newinitd "${FILESDIR}"/documize.initd documize
	newconfd "${FILESDIR}"/documize.confd documize
	systemd_dounit "${FILESDIR}"/documize.service
}
