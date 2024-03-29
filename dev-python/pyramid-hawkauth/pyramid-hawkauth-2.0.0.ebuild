# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{9,10,11,12} )

inherit distutils-r1

MY_P="${PN/-/_}-${PV}"

DESCRIPTION="A Pyramid authentication plugin for HAWK"
HOMEPAGE="https://github.com/mozilla-services/pyramid_hawkauth"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/pyramid-1.6[${PYTHON_USEDEP}]
	>=dev-python/tokenlib-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/hawkauthlib-2.0.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
