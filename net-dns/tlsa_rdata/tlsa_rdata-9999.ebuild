# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/shuque/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/shuque/${PN}/archive/${MY_PV}.tar.gz"
fi

inherit distutils-r1

DESCRIPTION="TLSA record rdata generator from X.509 certificate"
HOMEPAGE="https://github.com/shuque/tlsa_rdata"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/m2crypto[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}"

src_prepare() {
	mv tlsa_rdata.py tlsa_rdata || die
	distutils-r1_src_prepare
}
