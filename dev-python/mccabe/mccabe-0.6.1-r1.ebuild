# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python2_7 python3_{6,7,8,9} pypy3 )

inherit distutils-r1

DESCRIPTION="flake8 plugin: McCabe complexity checker"
HOMEPAGE="https://github.com/PyCQA/mccabe"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~mips ppc ppc64 s390 sparc x86 ~amd64-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
LICENSE="MIT"
SLOT="0"

RDEPEND="dev-python/flake8[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

python_prepare_all() {
	sed -i -e '/pytest-runner/d' setup.py || die
	distutils-r1_python_prepare_all
}
