# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 user

DESCRIPTION="Run-Your-Own Firefox Sync Server"
SRC_URI="https://github.com/mozilla-services/syncserver/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/configparser-1.5.0[${PYTHON_USEDEP}]
	dev-python/cornice[${PYTHON_USEDEP}]
	dev-python/moz-server-syncstorage[${PYTHON_USEDEP}]
	dev-python/moz-tokenserver[${PYTHON_USEDEP}]
	dev-python/mozsvc[${PYTHON_USEDEP}]
	dev-python/pyramid[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.3.3[${PYTHON_USEDEP}]
	dev-python/unittest2[${PYTHON_USEDEP}]
	dev-python/webob[${PYTHON_USEDEP}]
	dev-python/zope-component[${PYTHON_USEDEP}]
	www-servers/gunicorn[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

python_install_all() {
	distutils-r1_python_install_all

	keepdir /var/lib/${PN}

	newinitd "${FILESDIR}/syncserver.init" syncserver
	newconfd "${FILESDIR}/syncserver.conf" syncserver
}

pkg_postinst() {
	enewgroup syncserver
	enewuser syncserver -1 -1 /var/lib/syncserver syncserver
}
