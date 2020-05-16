# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=(  python{2_7,3_4,3_5,3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="Python bindings for Linux SPI access through spidev"
HOMEPAGE="https://github.com/doceme/py-spidev"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DOCS="README.md"
