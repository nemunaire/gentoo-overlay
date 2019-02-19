# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN=git.nemunai.re/eurocollec

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64 ~arm ~mips"
	EGIT_COMMIT=v${PV}
	SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi
inherit golang-build

DESCRIPTION="Explore your coins collection"
HOMEPAGE="https://eurocollec.p0m.fr"
LICENSE="AGPL-3"
SLOT="0"
IUSE=""
DEPEND="
	dev-go/go-bindata
	dev-go/httprouter
	dev-go/mysql
"
RDEPEND="virtual/mysql"

src_prepare() {
	cd "src/${EGO_PN}"
	GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" go generate -v
	default
}

src_install() {
	dobin ${PN}
	#dodoc src/${EGO_PN}/*.md
	newinitd "${FILESDIR}"/${PN}.init ${PN}
}
