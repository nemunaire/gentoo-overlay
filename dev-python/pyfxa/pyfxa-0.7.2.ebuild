# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7  python3_{4,5,6,7,8,9} )

inherit distutils-r1

MY_P="PyFxA-${PV}"

DESCRIPTION="Firefox Accounts client library for Python"
HOMEPAGE="https://github.com/mozilla/PyFxA"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/hawkauthlib[${PYTHON_USEDEP}]
	dev-python/pybrowserid[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
