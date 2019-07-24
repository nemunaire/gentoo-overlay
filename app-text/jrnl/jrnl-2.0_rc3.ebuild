# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{2_7,3_5,3_6,3_7} )

inherit distutils-r1

MY_P="${PN}-2.0.0rc3.post2"

DESCRIPTION="A command line journal application that stores your journal in a plain text file"
HOMEPAGE="http://www.jrnl.sh/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test doc"

RDEPEND=">=dev-python/parsedatetime-1.5[${PYTHON_USEDEP}]
	>=dev-python/pytz-2015.7[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-1.4[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
	>=dev-python/keyring-7.3[${PYTHON_USEDEP}]
	>=dev-python/passlib-1.6.2[${PYTHON_USEDEP}]
	>=dev-python/pyxdg-0.25[${PYTHON_USEDEP}]
	>=dev-python/asteval-0.9.8[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/keyrings_alt[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
