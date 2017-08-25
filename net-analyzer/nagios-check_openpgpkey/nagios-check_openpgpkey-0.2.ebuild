# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/nemunaire/check_openpgpkey.git"
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/nemunaire/check_openpgpkey/archive/v${PV}.tar.gz"
	KEYWORDS="~arm"
	MY_P="${P/nagios-/}"
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="check_openpgpkey is a Nagios plugin to check OPENPGPKEY (TYPE61) records"
HOMEPAGE="https://github.com/nemunaire/check_openpgpkey"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=">=app-crypt/gnupg-2
		dev-python/dnspython:py3
		net-analyzer/nagios-plugins"
RDEPEND="${DEPEND}"

src_install() {
	local nagiosplugindir="/usr/$(get_libdir)/nagios/plugins"
	exeinto "${nagiosplugindir}"
	doexe check_openpgpkey
}
