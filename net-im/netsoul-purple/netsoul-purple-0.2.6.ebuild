EAPI=5

inherit autotools

DESCRIPTION="Netsoul plugin for libpurple"
HOMEPAGE="https://github.com/sekh/netsoul-purple"
SRC_URI="https://github.com/sekh/${PN}/archive/${PV}.tar.gz"
IUSE="debug"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~arm ~amd64 ~x86"

DEPEND="dev-libs/glib"
RDEPEND="${DEPEND}
	net-im/pidgin"

src_prepare() {
        ./autogen.sh || die "Autogen failed"
}

src_configure() {
        econf $(use_enable debug) || die "configure failed"
}
