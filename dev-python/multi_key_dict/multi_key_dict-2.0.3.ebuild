# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7  python3_{4,5,6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Multi key dictionary implementation"
HOMEPAGE="https://github.com/formiaczek/multi_key_dict"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
