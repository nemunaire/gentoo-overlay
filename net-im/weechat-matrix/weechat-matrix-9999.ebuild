# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/poljar/weechat-matrix.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MY_PV}.tar.gz"
	KEYWORDS="~amd64 ~arm"
fi

inherit distutils-r1

DESCRIPTION="Weechat Matrix protocol script written in python"
HOMEPAGE="https://github.com/poljar/weechat-matrix"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/olm
"
BDEPEND="
	${RDEPEND}
"
