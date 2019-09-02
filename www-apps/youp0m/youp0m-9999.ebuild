# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN=git.nemunai.re/youp0m.git

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64 ~arm ~mips"
	EGIT_COMMIT=v${PV}
	SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi
inherit golang-build

DESCRIPTION="Display a daily cute picture"
HOMEPAGE="https://you.p0m.fr"
LICENSE="AGPL-3"
SLOT="0"
IUSE=""
DEPEND="
	dev-go/go-crypt
	dev-go/resize
"
RDEPEND=""

src_install() {
	mv ${PN}.git ${PN}
	dobin ${PN}
	newinitd "${FILESDIR}"/${PN}.init ${PN}
	keepdir /var/lib/${PN}
}
