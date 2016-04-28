# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

MY_PV=v${PV}

DESCRIPTION="TLSA record rdata generator from X.509 certificate"
HOMEPAGE="https://github.com/shuque/tlsa_rdata"
SRC_URI="https://github.com/shuque/${PN}/archive/${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/m2crypto"
DEPEND="${RDEPEND}"
