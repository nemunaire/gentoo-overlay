# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7  python3_{4,5,6,7,8} )

inherit distutils-r1

MY_P="${P/-/_}"

DESCRIPTION="A loader implementing the PasteDeploy syntax to be used by plaster."
HOMEPAGE="https://github.com/Pylons/plaster_pastedeploy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-python/plaster[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
