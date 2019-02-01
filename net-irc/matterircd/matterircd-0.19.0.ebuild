# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit golang-build golang-vcs-snapshot

EGO_PN=github.com/42wim/matterircd

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
	KEYWORDS=""
else
	SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm"
fi

DESCRIPTION="Connect to your local/remote mattermost installation or to slack via your IRC-client."
HOMEPAGE="https://${EGO_PN}"
LICENSE="MIT"
SLOT="0"
IUSE=""

src_install() {
	dobin ${PN}
	newinitd "${FILESDIR}"/${PN}.init ${PN}

	insinto /etc/
	newins "${S}/src/${EGO_PN}/matterircd.toml.example" matterircd.toml
}
