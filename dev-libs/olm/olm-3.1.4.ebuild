# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Implementation of the olm and megolm cryptographic ratchets"
HOMEPAGE="https://gitlab.matrix.org/matrix-org/olm"
SRC_URI="https://gitlab.matrix.org/matrix-org/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="Apache2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
