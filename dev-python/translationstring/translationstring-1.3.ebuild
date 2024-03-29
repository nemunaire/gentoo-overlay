# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8,9,10,11,12} pypy3 )

inherit distutils-r1

DESCRIPTION="Utility library for i18n relied on by various Repoze packages"
HOMEPAGE="https://github.com/Pylons/translationstring https://pypi.org/project/translationstring/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="repoze"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

# Include COPYRIGHT.txt because the license seems to require it.
DOCS=( COPYRIGHT.txt README.rst )

python_test() {
	esetup.py test
}

src_install() {
	distutils-r1_src_install

	# Install only the .rst source, as sphinx processing requires a
	# theme only available from git that contains hardcoded references
	# to files on https://static.pylonsproject.org/ (so the docs would
	# not actually work offline). Install into a "docs" subdirectory
	# so the reference in the README remains correct.
	docinto docs
	docompress -x usr/share/doc/${PF}/docs
	dodoc docs/*.rst
}
