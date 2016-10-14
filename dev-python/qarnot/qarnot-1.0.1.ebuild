# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="Qarnot computing SDK"
HOMEPAGE="https://computing.qarnot.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x64-macos"
IUSE="doc test"

RDEPEND="
	>=dev-python/requests-2.8.1[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	doc? ( dev-python/sphinx )
	test? ( dev-python/pytest )
"

PATCHES=(
	"${FILESDIR}/0001-Test-with-requests-2.8.1.patch"
)

python_prepare_all() {
	distutils-r1_python_prepare_all

	use doc && emake -C doc html
}

python_test() {
	python "${S}/setup.py" test || die "tests fail under ${EPYTHON}"
}

python_install_all() {
	use doc && HTML_DOCS=( doc/_build/html/{*.html,*.js,_sources,_static,_modules,api} )

	distutils-r1_python_install_all
}
