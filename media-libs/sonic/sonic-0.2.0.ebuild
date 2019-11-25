# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple library to speed up or slow down speech"
HOMEPAGE="http://dev.vinux-project.org/sonic"
SRC_URI="https://github.com/espeak-ng/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

S="${WORKDIR}/${PN}-release-${PV}"

PATCHES="${FILESDIR}/sonic-makefile-libdir.patch"

src_install() {
	emake \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="\$(PREFIX)/$(get_libdir)" \
		DESTDIR="${D}" \
		install
}
