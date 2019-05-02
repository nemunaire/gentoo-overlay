# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic

DESCRIPTION="Cyrus SASL library for Lua 5.1+ "
HOMEPAGE="https://github.com/JorjBauer/lua-cyrussasl"
SRC_URI="https://github.com/JorjBauer/lua-cyrussasl/archive/v${PV}.zip"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64 ~arm"

IUSE=""

RDEPEND="dev-lang/lua:*
	dev-libs/cyrus-sasl"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i '/CFLAGS=/d;/LDFLAGS=/d;/LUAPATH=/d;/CPATH=/d' Makefile \
		|| die "Unable to remove bad variables overwrite."

	sed -i '/$(LDFLAGS)/s/$/ $(LIBS)/' Makefile \
		|| die "Unable do required subtitution."

	append-cflags -fpic
	append-ldflags -O -shared -fpic
	append-libs -lsasl2 -llua

	default
}

src_install() {
	export CPATH=${D}/usr/lib/lua/5.1
	mkdir -p ${CPATH}

	default
}
