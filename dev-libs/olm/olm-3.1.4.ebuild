# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8} )

inherit cmake-utils python-r1

DESCRIPTION="Implementation of the olm and megolm cryptographic ratchets"
HOMEPAGE="https://gitlab.matrix.org/matrix-org/olm"
SRC_URI="https://gitlab.matrix.org/matrix-org/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	python? (
		${PYTHON_DEPS}
		dev-python/cffi[${PYTHON_USEDEP}]
		dev-python/future[${PYTHON_USEDEP}]
		dev-python/typing[${PYTHON_USEDEP}]
	)"

compile_pybinding() {
	cd python
	"${EPYTHON}" setup.py build || die
	python_optimize
}

src_compile() {
	default

	if use python; then
		python_foreach_impl compile_pybinding
	fi
}

install_pybinding() {
	cd python
	"${EPYTHON}" setup.py install --root="${D}" --prefix="${EPREFIX}/usr/" || die
	python_optimize
}

src_install() {
	default

	if use python; then
		python_foreach_impl install_pybinding
	fi
}
