# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7  python3_{4,5,6,7,8} )

inherit distutils-r1

DESCRIPTION="Canonical JSON"
HOMEPAGE="https://github.com/matrix-org/python-canonicaljson"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/frozendict-1.0.0[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
