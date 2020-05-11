# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7  python3_{4,5,6,7,8} )

inherit distutils-r1

DESCRIPTION="Hawk Access Authentication protocol"
HOMEPAGE="https://github.com/mozilla-services/hawkauthlib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/webob[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
