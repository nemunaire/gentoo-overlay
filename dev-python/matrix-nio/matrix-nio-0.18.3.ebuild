# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9,10} )

inherit distutils-r1

DESCRIPTION="A Python Matrix client library, designed according to sans I/O principles"
HOMEPAGE="https://github.com/poljar/matrix-nio"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="+e2e"

RDEPEND="
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiohttp-socks[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/h11[${PYTHON_USEDEP}]
	dev-python/hyper-h2[${PYTHON_USEDEP}]
	dev-python/logbook[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/unpaddedbase64[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	e2e? (
		dev-libs/olm[python,${PYTHON_USEDEP}]
		dev-python/peewee[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
		dev-python/atomicwrites[${PYTHON_USEDEP}]
	)
"
BDEPEND="${RDEPEND}"
