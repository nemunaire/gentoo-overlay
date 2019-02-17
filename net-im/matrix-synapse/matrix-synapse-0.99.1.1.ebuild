# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1 systemd user

DESCRIPTION="Synapse: Matrix reference homeserver"
HOMEPAGE="https://matrix.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-lang/python[sqlite]
	>=dev-python/jsonschema-2.5.1[${PYTHON_USEDEP}]
	>=dev-python/frozendict-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/unpaddedbase64-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/canonicaljson-1.1.3[${PYTHON_USEDEP}]
	>=dev-python/signedjson-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pynacl-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/service_identity-16.0.0[${PYTHON_USEDEP}]
	>=dev-python/twisted-18.7.0[${PYTHON_USEDEP}]
	>=dev-python/treq-15.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-16.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11.0[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.1.9[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-modules-0.0.7[${PYTHON_USEDEP}]
	>=dev-python/daemonize-2.4.2[${PYTHON_USEDEP}]
	>=dev-python/bcrypt-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-3.1.2[jpeg,${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/psutil-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pysaml2-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/pymacaroons-pynacl-0.9.3[${PYTHON_USEDEP}]
	>=dev-python/msgpack-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/phonenumbers-8.2.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	<dev-python/prometheus_client-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-17.4.0[${PYTHON_USEDEP}]
	>=dev-python/netaddr-0.7.18[${PYTHON_USEDEP}]
	virtual/libffi
"
DEPEND="
	${RDEPEND}
"

python_install_all() {
	distutils-r1_python_install_all

	keepdir /var/lib/${PN}

	newinitd "${FILESDIR}/synapse.init" synapse
	systemd_newunit "${FILESDIR}/synapse.service" synapse.service
}

pkg_postinst() {
	enewgroup synapse
	enewuser synapse -1 -1 /var/lib/synapse synapse
}
