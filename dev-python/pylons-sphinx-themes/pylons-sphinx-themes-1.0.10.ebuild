# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7  python3_{5,6,7,8} )

inherit distutils-r1

MY_PN="Sphinx themes for Pylons Project documentation."

DESCRIPTION="Sphinx Themes for Flask related projects and Flask itself"
HOMEPAGE="https://pylonsproject.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/sphinx[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
