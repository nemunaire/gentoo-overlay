# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P="server-syncstorage-${PV}"

DESCRIPTION="The SyncServer server software, as used by Firefox Sync"
HOMEPAGE="https://github.com/mozilla-services/server-syncstorage"
SRC_URI="https://github.com/mozilla-services/server-syncstorage/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/beautifulsoup-4.4.1[${PYTHON_USEDEP}]
	>=dev-python/cachetools-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2019.3.9[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	>=dev-python/configparser-3.5.0[${PYTHON_USEDEP}]
	dev-python/cornice[${PYTHON_USEDEP}]
	>=dev-python/enum34-1.1.6[${PYTHON_USEDEP}]
	>=dev-python/flake8-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/futures-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/gevent-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/google-api-core-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-1.6.3[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-core-0.29.1[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-spanner-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/googleapis-common-protos-1.5.9[${PYTHON_USEDEP}]
	>=dev-python/greenlet-0.4.9[${PYTHON_USEDEP}]
	>=dev-python/grpc-google-iam-v1-0.11.4[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-gcp-0.2.2[${PYTHON_USEDEP}]
	>=www-servers/gunicorn-19.9.0[${PYTHON_USEDEP}]
	>=dev-python/hawkauthlib-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/hupper-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/idna-2.7[${PYTHON_USEDEP}]
	>=dev-python/konfig-0.9[${PYTHON_USEDEP}]
	>=dev-python/linecache2-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/mccabe-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/mozsvc-0.10[${PYTHON_USEDEP}]
	>=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
	>=dev-python/paste-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/pastedeploy-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/plaster-1.0[${PYTHON_USEDEP}]
	>=dev-python/plaster-pastedeploy-0.7[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.7.1[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.4.5[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-modules-0.2.4[${PYTHON_USEDEP}]
	>=dev-python/pybrowserid-0.9.2[${PYTHON_USEDEP}]
	>=dev-python/pycodestyle-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/pyflakes-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/pymysql-0.6.7[${PYTHON_USEDEP}]
	>=dev-python/pymysql-sa-1.0[${PYTHON_USEDEP}]
	>=dev-python/pyramid-1.9.1[${PYTHON_USEDEP}]
	>=dev-python/pyramid-hawkauth-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.1[${PYTHON_USEDEP}]
	>=dev-python/repoze-lru-0.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/rsa-4.0[${PYTHON_USEDEP}]
	>=dev-python/simplejson-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.3.3[${PYTHON_USEDEP}]
	>=dev-python/testfixtures-4.3.3[${PYTHON_USEDEP}]
	>=dev-python/tokenlib-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/traceback2-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/translationstring-1.3[${PYTHON_USEDEP}]
	>=dev-python/umemcache-1.6.3[${PYTHON_USEDEP}]
	>=dev-python/unittest2-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.2[${PYTHON_USEDEP}]
	>=dev-python/venusian-1.0[${PYTHON_USEDEP}]
	>=dev-python/waitress-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/webob-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/webtest-2.0.18[${PYTHON_USEDEP}]
	>=dev-python/wsgiproxy-0.2.2[${PYTHON_USEDEP}]
	>=dev-python/zope-deprecation-4.1.2[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-4.1.3[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
