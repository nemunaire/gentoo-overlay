# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10,11,12} )

inherit distutils-r1

DESCRIPTION="Python implementation of systemd's service notification protocol (sd_notify)"
HOMEPAGE="https://github.com/bb4242/sdnotify
	https://pypi.org/project/sdnotify/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
