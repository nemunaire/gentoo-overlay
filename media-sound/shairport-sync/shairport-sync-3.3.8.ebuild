# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools user

DESCRIPTION="AirPlay audio player. Shairport Sync adds multi-room capability with Audio Synchronisation"
HOMEPAGE="https://github.com/mikebrady/shairport-sync"
SRC_URI="https://github.com/mikebrady/shairport-sync/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ALAC"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+alsa +avahi +ssl"

RDEPEND="
	dev-libs/openssl
	dev-libs/popt
	net-dns/avahi
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/libconfig
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local my_conf=(
		--sysconfdir="${EPREFIX}/etc"
		--with-configfiles
		$(use_with alsa)
		$(use_with avahi)
		--with-metadata
		$(use_with ssl ssl=openssl)
	)

	econf "${my_conf[@]}"
}

src_install() {
	default

	rm "${EPREFIX}/etc/shairport-sync.conf.sample"
	newinitd "${FILESDIR}/shairport-sync.init" shairport-sync
}
