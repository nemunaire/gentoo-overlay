# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Plumb a PDF for detailed information about each char, rectangle, and line."
HOMEPAGE="https://github.com/jsvine/pdfplumber"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

RDEPEND="
	app-text/pdfminer[${PYTHON_USEDEP}]
	>=dev-python/pillow-7[${PYTHON_USEDEP}]
	dev-python/wand[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
