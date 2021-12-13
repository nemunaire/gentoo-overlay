# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="Easily download an academic paper and send it to the reMarkable"
HOMEPAGE="https://github.com/GjjvdBurg/paper2remarkable"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

RDEPEND="
	app-text/ghostscript-gpl
	dev-python/pikepdf[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.8[${PYTHON_USEDEP}]
	dev-python/cssselect[${PYTHON_USEDEP}]
	>=dev-python/html2text-2020.1.16[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/pdfplumber-0.5[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/readability-lxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/regex-2018.11[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21[${PYTHON_USEDEP}]
	>=dev-python/titlecase-0.12[${PYTHON_USEDEP}]
	>=dev-python/unidecode-1.1[${PYTHON_USEDEP}]
	>=dev-python/weasyprint-51[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
