# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN=git.nemunai.re/ohsnap.git

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64 ~arm ~mips"
	EGIT_COMMIT=v${PV}
	SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi
inherit golang-build

DESCRIPTION="Snapchat clone using email"
HOMEPAGE="https://ohsnap.p0m.fr"
LICENSE="AGPL-3"
SLOT="0"
IUSE="+smtp-bridge"
DEPEND="dev-go/mysql"
RDEPEND="
	smtp-bridge? (
		dev-perl/Email-MIME
		dev-perl/JSON
		dev-perl/LWP-Protocol-https
		dev-perl/MailTools
	)
	virtual/mysql
"

src_install() {
	use smtp-bridge && dobin src/${EGO_PN}/smtp_bridge.pl

	mv ${PN}.git ${PN}
	dobin ${PN}
	dodoc src/${EGO_PN}/doc/*.md
	newinitd "${FILESDIR}"/${PN}.init ${PN}
	keepdir /var/lib/${PN}
}
