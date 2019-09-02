# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P="tokenserver-${PV}"

DESCRIPTION="The Mozilla Token Server"
HOMEPAGE="http://docs.services.mozilla.com/token/index.html"
SRC_URI="https://github.com/mozilla-services/tokenserver/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/alembic-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/asn1crypto-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/boto-2.49.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2019.3.9[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.12.2[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	>=dev-python/configparser-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/cornice-3.5.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/enum34-1.1.6[${PYTHON_USEDEP}]
	>=dev-python/hawkauthlib-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/hupper-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/idna-2.8[${PYTHON_USEDEP}]
	>=dev-python/ipaddress-1.0.22[${PYTHON_USEDEP}]
	>=dev-python/konfig-1.1[${PYTHON_USEDEP}]
	>=dev-python/mako-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/mozsvc-0.10[${PYTHON_USEDEP}]
	>=dev-python/paste-3.0.8[${PYTHON_USEDEP}]
	>=dev-python/pastedeploy-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/plaster-1.0[${PYTHON_USEDEP}]
	>=dev-python/plaster-pastedeploy-0.7[${PYTHON_USEDEP}]
	>=dev-python/pybrowserid-0.14.0[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.19[${PYTHON_USEDEP}]
	>=dev-python/pyfxa-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/pymysql-0.9.3[${PYTHON_USEDEP}]
	>=dev-python/pymysql-sa-1.0[${PYTHON_USEDEP}]
	>=dev-python/pyramid-1.10.4[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/python-editor-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/repoze-lru-0.7[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	>=dev-python/simplejson-3.16.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.3.3[${PYTHON_USEDEP}]
	>=dev-python/testfixtures-6.7.0[${PYTHON_USEDEP}]
	>=dev-python/tokenlib-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/translationstring-1.3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.2[${PYTHON_USEDEP}]
	>=dev-python/venusian-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/webob-1.8.5[${PYTHON_USEDEP}]
	>=dev-python/zope-deprecation-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-4.6.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
