# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 python3_{4,5,6,7,8,9,10,11,12} )

inherit distutils-r1

DESCRIPTION="Python bindings for Linux SPI access through spidev"
HOMEPAGE="https://github.com/doceme/py-spidev"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DOCS="README.md"
