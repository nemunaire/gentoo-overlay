# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )

inherit cmake python-r1

DESCRIPTION="Implementation of the olm and megolm cryptographic ratchets"
HOMEPAGE="https://gitlab.matrix.org/matrix-org/olm"
SRC_URI="https://gitlab.matrix.org/matrix-org/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test +python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"
RESTRICT="!test? ( test )"

RDEPEND="
	python? (
		${PYTHON_DEPS}
		dev-python/cffi[${PYTHON_USEDEP}]
		dev-python/future[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	)"

compile_pybinding() {
	cd python
	"${EPYTHON}" setup.py build || die
	python_optimize
}

src_configure() {
	local -a mycmakeargs=(
		-DOLM_TESTS="$(usex test)"
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	if use python; then
		python_foreach_impl compile_pybinding
	fi
}

src_test() {
	BUILD_DIR="${BUILD_DIR}/tests" cmake_src_test
}

install_pybinding() {
	cd python
	"${EPYTHON}" setup.py install --root="${D}" --prefix="${EPREFIX}/usr/" || die
	python_optimize
}

src_install() {
	use doc && DOCS=( README.md docs/{{,meg}olm,signing}.md )

	cmake_src_install

	if use python; then
		python_foreach_impl install_pybinding
	fi
}
