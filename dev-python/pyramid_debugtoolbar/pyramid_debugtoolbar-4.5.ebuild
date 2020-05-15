# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7  python3_{5,6,7,8} )

inherit distutils-r1

DESCRIPTION="A package which provides an interactive HTML debugger for Pyramid application development"
HOMEPAGE="https://docs.pylonsproject.org/projects/pyramid-debugtoolbar/en/latest/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/pyramid[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
