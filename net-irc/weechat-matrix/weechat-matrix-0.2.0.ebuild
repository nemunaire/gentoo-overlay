# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Weechat Matrix protocol script written in python"
HOMEPAGE="https://github.com/poljar/weechat-matrix"
SRC_URI="https://github.com/poljar/weechat-matrix/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
IUSE=""

DISTUTILS_USE_SETUPTOOLS=pyproject.toml

RDEPEND="
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/typing[${PYTHON_USEDEP}]
	dev-python/webcolors[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/atomicwrites[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/logbook[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/python-magic[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/matrix-nio[e2e,${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}
	dev-python/pyproject2setuppy[${PYTHON_USEDEP}]
"
