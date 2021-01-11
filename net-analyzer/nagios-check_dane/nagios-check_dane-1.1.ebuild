# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8,9} )

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/debfx/check_dane.git"
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/debfx/check_dane/archive/${PV}.tar.gz"
	KEYWORDS="~arm"
	MY_P=${P/nagios-/}
	S="${WORKDIR}/${MY_P}"
fi

inherit multilib

DESCRIPTION="check_dane is a set of Nagios plugins to check DANE/TLSA records"
HOMEPAGE="https://github.com/debfx/check_dane"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-libs/openssl:0
		dev-python/dnspython
		net-analyzer/nagios-plugins"
RDEPEND="${DEPEND}"

src_install() {
	local nagiosplugindir="/usr/$(get_libdir)/nagios/plugins"
	exeinto "${nagiosplugindir}"
	doexe check_dane
}
