# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )

inherit git-r3 multilib

DESCRIPTION="check_dane is a set of Nagios plugins to check DANE/TLSA records"
HOMEPAGE="https://github.com/debfx/check_dane"

EGIT_REPO_URI="https://github.com/debfx/check_dane.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/openssl:0
		dev-python/dnspython:py3
		net-analyzer/nagios-plugins"
RDEPEND="${DEPEND}"

src_install() {
	local nagiosplugindir="/usr/$(get_libdir)/nagios/plugins"
	insinto "${nagiosplugindir}"
	doexe check_dane
}
