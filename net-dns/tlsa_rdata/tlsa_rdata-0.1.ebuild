# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{8,9,10} )

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
