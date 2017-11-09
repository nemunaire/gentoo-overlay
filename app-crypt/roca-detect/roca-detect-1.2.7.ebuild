# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/crocs-muni/roca.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~arm"
fi

inherit distutils-r1

DESCRIPTION="ROCA detection tool"
HOMEPAGE="https://crocs.fi.muni.cz/public/papers/rsa_ccs17"

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	>=dev-python/m2crypto-2.6[${PYTHON_USEDEP}]
	dev-python/pgpdump[${PYTHON_USEDEP}]
	>=dev-python/pycrypto-2.6[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	>=dev-python/pyusb-1.0.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
"
