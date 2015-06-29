EAPI=5

inherit autotools git-r3

DESCRIPTION="Netsoul plugin for libpurple"
HOMEPAGE="https://github.com/sekh/netsoul-purple"
EGIT_REPO_URI="https://github.com/sekh/netsoul-purple.git"
IUSE="debug"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS=""

DEPEND="dev-libs/glib"
RDEPEND="${DEPEND}
	net-im/pidgin"

src_prepare() {
        ./autogen.sh || die "Autogen failed"
}

src_configure() {
        econf $(use_enable debug) || die "configure failed"
}
