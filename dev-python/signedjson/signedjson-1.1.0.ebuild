# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7  python3_{4,5,6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Sign JSON objects with ED25519 signatures"
HOMEPAGE="https://github.com/matrix-org/python-signedjson"
SRC_URI="https://github.com/matrix-org/python-signedjson/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/canonicaljson[${PYTHON_USEDEP}]
	dev-python/pynacl[${PYTHON_USEDEP}]
	dev-python/unpaddedbase64[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/python-${P}"
