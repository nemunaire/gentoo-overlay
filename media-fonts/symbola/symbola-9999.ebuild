# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Unicode font for Latin, IPA Extensions, Greek, Cyrillic and many Symbol Blocks"
HOMEPAGE="http://users.teilar.gr/~g1951d/"
SRC_URI="https://dn-works.com/wp-content/uploads/2020/UFAS-Fonts/Symbola.zip -> ${P}.zip"
LICENSE="all-rights-reserved"

SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE=""
RESTRICT="mirror bindist"

BDEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="otf"
