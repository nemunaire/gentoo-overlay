# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7,8,9} )

inherit distutils-r1

DESCRIPTION="The Pyramid Web Framework, a Pylons project"
HOMEPAGE="https://trypyramid.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/hupper-1.5[${PYTHON_USEDEP}]
	dev-python/plaster[${PYTHON_USEDEP}]
	dev-python/plaster-pastedeploy[${PYTHON_USEDEP}]
	>=dev-python/translationstring-0.4[${PYTHON_USEDEP}]
	>=dev-python/venusian-1.0[${PYTHON_USEDEP}]
	>=dev-python/webob-1.8.3[${PYTHON_USEDEP}]
	>=dev-python/zope-deprecation-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-3.8.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
