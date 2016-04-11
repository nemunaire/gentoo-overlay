# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/stump/check_sshfp.git"
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/stump/check_sshfp/archive/${PV}.tar.gz"
	KEYWORDS="~arm"
	MY_P=${P/nagios-/}
	S="${WORKDIR}/${MY_P}"
fi

inherit multilib

DESCRIPTION="check_sshfp is a Nagios plugins to check SSHFP records"
HOMEPAGE="https://github.com/stump/check_sshfp"

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="dev-python/dnspython:py3
		net-analyzer/nagios-plugins
		net-misc/openssh"
RDEPEND="${DEPEND}"

src_install() {
	local nagiosplugindir="/usr/$(get_libdir)/nagios/plugins"
	exeinto "${nagiosplugindir}"
	doexe check_sshfp
}
