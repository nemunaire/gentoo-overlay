
# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Qarnot computing SDK"
HOMEPAGE="https://computing.qarnot.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="
	>=dev-python/requests-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.4.4[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	doc? ( dev-python/sphinx )
	test? ( dev-python/pytest )
"

python_prepare_all() {
	distutils-r1_python_prepare_all

	use doc && emake -C doc html
}

python_test() {
	pytest || die "tests fail under ${EPYTHON}"
}

python_install_all() {
	use doc && HTML_DOCS=( doc/_build/html/{*.html,*.js,_sources,_static,_modules,api} )

	distutils-r1_python_install_all
}
