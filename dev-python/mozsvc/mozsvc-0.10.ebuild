# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Various utilities for Mozilla apps"
HOMEPAGE="https://github.com/mozilla-services/mozservices"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/pyramid-1.5[${PYTHON_USEDEP}]
	dev-python/pyramid_debugtoolbar[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	dev-python/cef[${PYTHON_USEDEP}]
	dev-python/unittest2[${PYTHON_USEDEP}]
	dev-python/webtest[${PYTHON_USEDEP}]
	dev-python/wsgiproxy[${PYTHON_USEDEP}]
	dev-python/pyramid-hawkauth[${PYTHON_USEDEP}]
	dev-python/tokenlib[${PYTHON_USEDEP}]
	dev-python/hawkauthlib[${PYTHON_USEDEP}]
	>=dev-python/umemcache-1.3[${PYTHON_USEDEP}]
	www-servers/gunicorn[${PYTHON_USEDEP}]
	dev-python/gevent[${PYTHON_USEDEP}]
	dev-python/konfig[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
